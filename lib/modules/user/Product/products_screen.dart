import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/ditals/ditals_screen.dart';
import 'package:furniture_store/modules/user/item/item_screen.dart';
import 'package:furniture_store/shared/component/component.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List items = [
    'https://i.pinimg.com/736x/79/11/b9/7911b9cac1f574e675d4b5d3903207e6.jpg',
    'https://i.pinimg.com/564x/db/51/95/db519529496b547c93d1ad8b230559b0.jpg',
    'https://d13r0hznkpv24o.cloudfront.net/media/catalog/product/cache/74cf99c86332999c0c5bbe50aaa1b73c/l/e/lego_5_1.png',
    'https://i.pinimg.com/originals/ac/43/f5/ac43f531373013c83d1af9a3fddc931e.jpg',
    'https://i.pinimg.com/564x/79/d3/4e/79d34ee3f5dc45477308641955db6117.jpg',
  ];

  List categoriesItems = [
    'Bed Room',
    'Kids Room',
    'Dining Room',
    'Living Room',
    'Salon',
    'Kitchen',
    'Offices',
    'Antiques',
    'Carpets',
    'Lighting',
    'Chairs',
    'Curtains',
    'Table',
    'Out door',
    'Appliances',
  ];

  List picture = [
    'image/bedroom.png',
    'image/kids room.png',
    'image/dining room.png',
    'image/living room.png',
    'image/salon.png',
    'image/kitchen.png',
    'image/office.png',
    'image/antiques.png',
    'image/carpet.png',
    'image/lighting.png',
    'image/chair.png',
    'image/curtain.png',
    'image/tables.png',
    'image/outdoor.png',
    'image/appliances.png',
  ];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: items
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
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          navigateto(
                            context,
                            ItemScreen(categoriesItems[index]),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          width: 83,
                          height: 40,
                          child: Card(
                            elevation: 15,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(picture[index]),
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${categoriesItems[index]}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 5.0,
                      ),
                      itemCount: categoriesItems.length,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateto(context, const DetailsScreen());
                    },
                    child: Center(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50.0))),
                        height: 190,
                        width: 320,
                        child: Card(
                          margin: const EdgeInsetsDirectional.all(5),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              const Image(
                                image: NetworkImage(
                                    'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163641874-163641874-HC27062021_02-750-1.jpg?v=1'),
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    'Galaxy Metal Floor Lamp',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '50.000 EGP',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  GestureDetector(
                    onTap: () {
                      navigateto(context, const DetailsScreen());
                    },
                    child: Center(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        height: 190,
                        width: 320,
                        child: Card(
                          margin: const EdgeInsetsDirectional.all(5),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              const Image(
                                image: NetworkImage(
                                    'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163639532-163639532-HC11102021_02-750-1.jpg'),
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    'Piece Glass Top Coffee',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '50.000 EGP',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateto(context, const DetailsScreen());
                    },
                    child: Center(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        height: 190,
                        width: 320,
                        child: Card(
                          margin: const EdgeInsetsDirectional.all(5),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              const Image(
                                image: NetworkImage(
                                    'https://target.scene7.com/is/image/Target/GUEST_b0aa50c3-ce9c-4fea-93bf-e6dffb91818b?wid=325&hei=325&qlt=80&fmt=pjpeg'),
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    'Century Club Chair',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '2.000 EGP',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateto(context, const DetailsScreen());
                    },
                    child: Center(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        height: 190,
                        width: 320,
                        child: Card(
                          margin: const EdgeInsetsDirectional.all(5),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              const Image(
                                image: NetworkImage(
                                    'https://i.pinimg.com/736x/c2/03/bb/c203bb64b6d658c34d56e485e7a11224.jpg'),
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    'Home Office Design ',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '14.000 EGP',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateto(context, const DetailsScreen());
                    },
                    child: Center(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        height: 190,
                        width: 320,
                        child: Card(
                          margin: const EdgeInsetsDirectional.all(5),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              const Image(
                                image: NetworkImage(
                                    'https://i.pinimg.com/564x/31/c3/db/31c3dbc6d38e11a452e902d8775a5aa4.jpg'),
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    'Tapete Sala e Quarto',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '45.000 EGP',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
