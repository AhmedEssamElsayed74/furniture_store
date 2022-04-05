import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/ditals/ditals_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:furniture_store/shared/style/color.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index)=>buildListProductItem(context ),
                    separatorBuilder: (context,index)=>myDivider(),
                    itemCount: 3,
                  ),
                ],
              ),
        );
      },
    );
  }
}
Widget buildListProductItem( context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: 150,
    height: 150,
    child: GestureDetector(
      onTap: ()
      {
        navigateto(context, const DetailsScreen());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: NetworkImage(
              'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163641874-163641874-HC27062021_02-750-1.jpg?v=1',
            ),

            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Galaxy Metal Floor Lamp ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 15.0,),
                const Text(
                  '25x96 cm',
                  style: TextStyle(
                    color: defaultcolor,
                  ),
                ),
                const SizedBox(height: 15.0,),

                Row(
                  children: const [
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
                const SizedBox(height: 15.0,),
                Row(
                  children: [
                    RaisedButton(onPressed: ()
                    {
                      showToast(text: " The Item is added to Cart ", state: ToastState.SUCCESS);

                    },
                      child: const Text('add to cart',
                      style: TextStyle(
                          color: Colors.white,
                      ),),
                      color: Colors.lightBlue,
                      padding: const EdgeInsets.all(0),

                    ),
                    const Spacer(),
                    IconButton(onPressed: (){}, icon:
                    const Icon(Icons.favorite,
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




