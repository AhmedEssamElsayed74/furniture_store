import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/checkout/checkout.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:hexcolor/hexcolor.dart';




class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

 Widget BuildDetails()
 {
   return BlocConsumer<ShopCubit, ShopStates>(
     listener: (context, state) {},
     builder: (context, state) {
       var cubit = ShopCubit.get(context);

       return Scaffold(

         body: SafeArea(
           child: Column(
             children:
             [
               Stack(
                 children: [
                   Container(

                     child:  CarouselSlider(
                       items: cubit.detailsPicture
                           .map((image) => Builder(
                         builder: (BuildContext context) {
                           return Container(
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: NetworkImage(image),
                                 fit: BoxFit.fill,
                               ),
                             ),
                           );
                         },
                       ))
                           .toList(),
                       options: CarouselOptions(
                         height: 250.0,
                         initialPage: 0,
                         enableInfiniteScroll: true,
                         viewportFraction: 1,
                         reverse: false,
                         autoPlay: true,
                         autoPlayInterval: const Duration(seconds: 3),
                         autoPlayAnimationDuration: const Duration(seconds: 1),
                         autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                         scrollDirection: Axis.horizontal,
                       ),
                     ),
                   ),
                   IconButton(onPressed: (){
                     Navigator.pop(context);
                   }, icon: Icon(Icons.arrow_back,color: Colors.white,))
                 ],
               ),
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
                           children: const [
                             Text(
                               'Galaxy Metal Floor Lamp',
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
                                 borderRadius: const BorderRadiusDirectional.only(
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
                                   const [
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
                                     SizedBox(height: 10,),
                                     Text(
                                       'This contemporary floor lamp is designed to be a convenient option for elegant home settings. It comes with 6 bulbs in a spherical shape, which gives a soothing light that is pleasing to the eyes. Easy to clean with a regular wipe to preserve its appearance as long as possible.',
                                       style: TextStyle(
                                         fontSize: 15,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(
                                 borderRadius: const BorderRadius.only(
                                   topLeft: Radius.circular(40),
                                   topRight: Radius.circular(40),
                                 ),
                                 color: HexColor('#087083'),
                               ),
                               height: 80,
                               child: Row(
                                 children:
                                 [
                                   const SizedBox(width: 35,),
                                   Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: Colors.white,
                                     ),
                                     width: 45,
                                     height: 45,
                                     child: IconButton(
                                       icon: const Icon(Icons.favorite_outline_rounded,size: 25,), onPressed: (){},
                                     ),
                                   ),
                                   const SizedBox(width: 65,),
                                   Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         color: Colors.white,
                                       ),
                                       width: 170,
                                       height: 45,
                                       child: TextButton(
                                         onPressed: () { navigateto(context, CheckOutScreen()); },
                                         child: const Text('Checkout',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
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
         ),
       );
     },
   );

 }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

        body:
        OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
                ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if(connected){
                return BuildDetails();
              }else
              {
                return BuildNoInternetWidget();
              }
            },
            child: const Center(child: CircularProgressIndicator(),)
        )
    );  }

}




