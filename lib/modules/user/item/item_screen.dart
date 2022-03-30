import 'package:flutter/material.dart';
import 'package:furniture_store/modules/user/ditals/ditals_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:furniture_store/shared/style/color.dart';


class ItemScreen extends StatelessWidget {

  final String title;

  const ItemScreen(this.title);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title,
        style:const TextStyle(
          color: Colors.white,
        ) ,
        ),
      ),
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index)=>buildListProductItem( context),
              separatorBuilder: (context,index)=>myDivider(),
              itemCount: 15,
            ),
          ],
        ),
      ),
    );
  }

}

Widget buildListProductItem(context )=> GestureDetector(
  onTap: (){
    navigateto(context, DetailsScreen());
  },
  child:Padding(
  padding: const EdgeInsets.all(20.0),
    child: Container(
      width: 150,
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: NetworkImage(
              'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163641874-163641874-HC27062021_02-750-1.jpg?v=1',
                     ),

            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Galaxy Metal Floor Lamp',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 15.0,),
                Text(
                  '25x96 cm',
                  style: TextStyle(
                    color: defaultcolor,
                  ),
                ),
                SizedBox(height: 15.0,),

                Row(
                  children: [
                    Text(
                      '100.000',
                      style: TextStyle(
                        color: defaultcolor,
                      ),
                    ),
                    SizedBox(width: 15.0,),

                      Text(
                        '25.000',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 15.0,),
               Row(
                 children: [
                RaisedButton(onPressed: ()
                {
                  showToast(text: " The Item is added to Cart ", state: ToastState.SUCCESS);
                },
                  child: Text('add to cart',
                style: TextStyle(
                  color: Colors.white
                ),),
                  color: Colors.lightBlue,

                ),
                  Spacer(),
                   IconButton(onPressed: ()
                   {
                     showToast(text: " The Item is added to Favourite ", state: ToastState.SUCCESS);

                   },
                     icon:
                   Icon(Icons.favorite_outline_rounded,
                     size: 25.0,
                     color: Colors.black,
                   ),

                   ),

                 ],
               ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);


