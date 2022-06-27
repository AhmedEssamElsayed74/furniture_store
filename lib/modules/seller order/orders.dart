import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/ditals/ditals_screen.dart';
import 'package:furniture_store/modules/user/favourite/favourite_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:furniture_store/shared/style/color.dart';
import 'package:hexcolor/hexcolor.dart';

class sellerOrders extends StatelessWidget {

  const sellerOrders();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Orders",
              style: TextStyle(
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
                      buildListProductItemOrder(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 1,
                  ),
                  itemCount: 3,
                ),
                const SizedBox(height: 15,),
                MaterialButton(
                  onPressed: (){},

                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                  minWidth: 140,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding: EdgeInsets.zero,
                  color: HexColor('#087083'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildListProductItemOrder({
  context,
  productsList,
  buttonName,
  buttonFunction,
  iconName,
  iconFunction,

}) =>
    Center(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        height: 170,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        child: Card(
          margin: const EdgeInsetsDirectional.all(5),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //______ الصوره ______
              Container(
                height: 190,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://target.scene7.com/is/image/Target/GUEST_b0aa50c3-ce9c-4fea-93bf-e6dffb91818b?wid=325&hei=325&qlt=80&fmt=pjpeg",
                      ),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(
                width: 10.0,
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    //_______ productName _________
                    const Text(
                      "Century Club Chair",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),

                    //______ size _______
                    const Text(
                      "15x10x30 Cm",
                      style: TextStyle(
                        color: defaultcolor,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),

                    //______ price _____

                    Container(
                      //______ لو في خصم ____
                        child: "200" ==
                            'NoDiscount'
                            ? const Text(
                          "12000 EGP",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                        //____ لو مفيش خصم هيكون السعر العادي بس ___
                            : Row(
                          children: const [
                            Expanded(
                              child: Text(
                                "1200 EGP",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Text(
                                "50000 EGP",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red,
                                  decoration:
                                  TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ],
                        )),

                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Item number:",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "2",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),

                      ],
                    ),


                    //_________ add to cart and favourite
                    // Row(
                    //   children: [
                    //     MaterialButton(
                    //       onPressed: (){},
                    //
                    //       child:  Text(
                    //         buttonName,
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       padding: EdgeInsets.zero,
                    //       color: HexColor('#087083'),
                    //       highlightColor: Colors.teal,
                    //     ),
                    //     const Spacer(),
                    //     IconButton(
                    //       onPressed: (){},
                    //       icon: iconName,
                    //
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

