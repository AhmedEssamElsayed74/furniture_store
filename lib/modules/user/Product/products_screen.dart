import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/ditals/ditals_screen.dart';
import 'package:furniture_store/modules/user/item/item_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:furniture_store/shared/style/color.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  Widget BuildProduct()
  {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: cubit.items
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
                    height: 180.0,
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
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(

                  height: 60,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => builtcategory(context,index),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 5.0,
                    ),
                    itemCount: cubit.categoriesItems.length,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  itemBuilder: (context, index) => builtcategory2(context,index),
                  // GestureDetector(
                  //   onTap: () {
                  //     navigateto(context, const DetailsScreen());
                  //   },
                  //   child: Center(
                  //     child: Container(
                  //       decoration: const BoxDecoration(
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(50.0))),
                  //       height: 170,
                  //       width: double.infinity,
                  //       padding: EdgeInsets.symmetric(horizontal: 7),
                  //       child: Card(
                  //         margin: const EdgeInsetsDirectional.all(5),
                  //         clipBehavior: Clip.antiAliasWithSaveLayer,
                  //         elevation: 10,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //              Image(
                  //               image: NetworkImage(
                  //                   '${cubit.products[index].image}'),
                  //               width: 150,
                  //               height: 190,
                  //               fit: BoxFit.fill,
                  //             ),
                  //             const SizedBox(
                  //               width: 5,
                  //             ),
                  //             Expanded(
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children:  [
                  //                   const SizedBox(
                  //                     height: 10,
                  //                   ),
                  //                   Text(
                  //                   '${cubit.products[index].name}',
                  //                     maxLines: 2,
                  //                     overflow: TextOverflow.ellipsis,
                  //                     style: const TextStyle(
                  //                         fontSize: 13,
                  //                         fontWeight: FontWeight.bold
                  //                     ),
                  //                   ),
                  //                   const SizedBox(
                  //                     height: 20,
                  //                   ),
                  //                    Text(
                  //                     ' ${cubit.products[index].size}'+" cm",
                  //                     style: TextStyle(
                  //                       color: Colors.blue,
                  //                     ),
                  //                   ),
                  //                   const SizedBox(
                  //                     height: 20,
                  //                   ),
                  //                  Row(
                  //                    children:
                  //                    [
                  //                      Text(
                  //                        '${cubit.products[index].price - (cubit.products[index].price * (cubit.products[index].discount / 100))}'+ " EGP",
                  //                        style: const TextStyle(
                  //                            color: Colors.black,
                  //                        ),
                  //                      ),
                  //
                  //                      SizedBox(
                  //                        width: 15,
                  //                      ),
                  //
                  //                      Text(
                  //                        '${cubit.products[index].price}',
                  //                        style: const TextStyle(
                  //                            color: Colors.grey,
                  //                          decoration: TextDecoration.lineThrough,
                  //                        ),
                  //                      ),
                  //
                  //
                  //                    ],
                  //                  )
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: cubit.products.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              return BuildProduct();
            }else
            {
              return BuildNoInternetWidget();
            }
          },
          child: const Center(child: CircularProgressIndicator(),)
        )
    );
  }




  Widget builtcategory(context,index)

  {
    var cubit = ShopCubit.get(context);
    return GestureDetector(
      onTap: () {
        navigateto(
          context,
          ItemScreen(cubit.categoriesItems[index]),
        );
        print(index);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(30.0)),

        ),
        width: 83,
        height: 40,
        child: Card(
          color: Colors.grey[100],
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(cubit.picture[index]),
                width: 20,
                height: 20,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${cubit.categoriesItems[index]}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget builtcategory2(context,index)
  {
    var cubit = ShopCubit.get(context);
    return GestureDetector(
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
          padding: const EdgeInsets.symmetric(horizontal: 7),
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
                      const SizedBox(height: 5,),
                      Text(
                        '${cubit.products[index].name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '${cubit.products[index].size}'+' cm',
                        style: const TextStyle(
                          color: defaultcolor,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children:  [
                          Text(
                            '${cubit.products[index].price - (cubit.products[index].price * (cubit.products[index].discount / 100))}'+ " EGP",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            '${cubit.products[index].price}',
                            style: const TextStyle(
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
                          RaisedButton(
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
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              showToast(
                                  text: " The Item is added to Favourite ",
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
  }

}
