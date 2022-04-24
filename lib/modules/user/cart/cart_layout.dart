import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/checkout/checkout.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:furniture_store/shared/style/color.dart';
import 'package:hexcolor/hexcolor.dart';

class CartLayout extends StatefulWidget {
   const CartLayout({Key? key}) : super(key: key);

  @override
  State<CartLayout> createState() => _CartLayoutState();
}

class _CartLayoutState extends State<CartLayout> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
     listener: (context, state) {},
  builder: (context, state) {
    var cubit = ShopCubit.get(context);
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
        title: const Text('Cart',style: TextStyle(color: Colors.white),),
      ),
      body:  Column(
        children: [
          Expanded(
            child:  ListView.separated(

              itemBuilder: (context, index) => Center(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        cubit.Itemnum[0]++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text('${cubit.Itemnum[0]}'),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        if (cubit.Itemnum[0] > 1) {
                                          cubit.Itemnum[0]--;
                                        } else {}
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      var alert = AlertDialog(
                                          title: const Text(
                                            'Are you sure you want delete?',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          content: SizedBox(
                                            height: 30,
                                            child: Container(
                                              color: Colors.white,
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 10.0),
                                                    child: TextButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            fontSize: 14,
                                                            color:
                                                            Colors.blue,
                                                          ),
                                                        )),
                                                  ),
                                                  const Spacer(),
                                                  TextButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'No',
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: 14,
                                                          color: Colors.red,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ));
                                      showDialog(
                                          context: context,
                                          builder: (context) => alert);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
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
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: cubit.products.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics()
            ),
          ),
          Card(
            elevation: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Total Price ' +
                          (cubit.totalprice + cubit.Itemnum[0] * 2000).toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {navigateto(context, CheckOutScreen());},
                  child: const Text('checkout',style: TextStyle(color: Colors.white),),
                  color: HexColor('#087083'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
