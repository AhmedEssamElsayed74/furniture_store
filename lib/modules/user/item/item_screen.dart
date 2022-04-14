import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/ditals/ditals_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:furniture_store/shared/style/color.dart';
import 'package:hexcolor/hexcolor.dart';


class ItemScreen extends StatelessWidget {

  final String title;

  const ItemScreen(this.title);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      HexColor('#087083'),
                      HexColor('#5AB5C6'),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
              ),
            ),
            title: Text(title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildListProductItem(context,index),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: ShopCubit.get(context).products.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}

Widget buildListProductItem(context,index) =>
    GestureDetector(
      onTap: () {
        navigateto(context, const DetailsScreen());
      },

      child: Center(
        child: Container(

          decoration: const BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(50.0))),
          height: 170,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
          child: Card(
            margin: const EdgeInsetsDirectional.all(5),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 190,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${ShopCubit.get(context).products[index].image}',
                      ), 
                      fit: BoxFit.fill,
                      
                    )
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                      Text(
                        '${ShopCubit.get(context).products[index].name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '${ShopCubit.get(context).products[index].size}' + ' cm',
                        style: TextStyle(
                          color: defaultcolor,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '${ShopCubit.get(context).products[index].price - (ShopCubit.get(context)
                                .products[index].price * (ShopCubit.get(context).products[index]
                                .discount / 100))}' + " EGP",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            '${ShopCubit.get(context).products[index].price}',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                              decoration:
                              TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          MaterialButton(

                            onPressed: () {
                              showToast(
                                  text:
                                  " The Item is added to Cart ",
                                  state: ToastState.SUCCESS);
                            },
                            child: const Text(
                              'add to cart',
                              style:
                              TextStyle(color: Colors.white),
                            ),
                            padding:EdgeInsets.zero ,
                            color: HexColor('#087083'),
                            highlightColor: Colors.teal,
                            splashColor:Colors.yellow ,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              showToast(
                                  text:
                                  " The Item is added to Favourite ",
                                  state: ToastState.SUCCESS);
                            },
                            icon: const Icon(
                              Icons.favorite_outline_rounded,
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
      ),
    );


