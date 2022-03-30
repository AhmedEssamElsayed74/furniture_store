import 'package:flutter/material.dart';
import 'package:furniture_store/modules/user/checkout/checkout.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:hexcolor/hexcolor.dart';




class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () { Navigator.pop(context); },
        icon: Icon(Icons.arrow_back,color: Colors.black,)),

      ),
     body: Column(
       children:
       [
        Center(
          child: Container(
            child: Image(image: NetworkImage('https://target.scene7.com/is/image/Target/GUEST_b0aa50c3-ce9c-4fea-93bf-e6dffb91818b?wid=325&hei=325&qlt=80&fmt=pjpeg'),
              width: 400,
              height: 200,
            ),
          ),
        ),
         SizedBox(height: 15,),
         Expanded(
           child: Container(
             width: double.infinity,
             height: 115,
             color: HexColor('#EEEEEE'),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children:
               [
                 Padding(
                   padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'Century Club Chair ',
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(
                           fontSize: 18,
                           fontWeight:
                             FontWeight.bold,
                         ),
                       ),
                       SizedBox(height: 10,),
                       Text(
                         '30x50x100 Cm',
                         style: TextStyle(
                           color: Colors.black,
                           fontSize: 15,
                           fontWeight:
                           FontWeight.bold,
                         ),
                       ),
                       SizedBox(height: 10,),
                       Text(
                         '2.000 EGP',
                         style: TextStyle(
                           color: Colors.black,
                           fontSize: 15,
                           fontWeight:
                           FontWeight.bold,
                         ),
                       ),
                       SizedBox(height: 15,),
                     ],
                   ),
                 ),
                 Expanded(
                   child: Stack(
                     alignment: AlignmentDirectional.bottomCenter,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadiusDirectional.only(
                             topEnd: Radius.circular(30.0),
                             topStart: Radius.circular(30.0),

                           ),
                           color: HexColor('#D6D6D6'),
                         ),
                         width: double.infinity,
                         child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children:
                             [
                               Text(
                                 'About: ',
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                 style: TextStyle(
                                   fontSize: 18,
                                   fontWeight:
                                   FontWeight.bold,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(40),
                             topRight: Radius.circular(40),
                           ),
                           color: HexColor('#087083'),
                          ),
                         height: 80,
                         child: Row(
                           children:
                           [
                             SizedBox(width: 35,),
                             Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: Colors.white,
                               ),
                               width: 45,
                               height: 45,
                               child: IconButton(
                                 icon: Icon(Icons.favorite_outline_rounded,size: 25,), onPressed: (){},
                               ),
                             ),
                             SizedBox(width: 65,),
                             Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: Colors.white,
                               ),
                               width: 170,
                               height: 45,
                               child: TextButton(
                                  onPressed: () { navigateto(context, CheckOutScreen()); },
                                  child: Text('Checkout',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                               )
                             ),


                           ],
                         ),
                       )
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),

       ],
     ),
    );
  }

}




