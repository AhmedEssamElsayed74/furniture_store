import 'package:flutter/material.dart';
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
  var Itemnum = [5, 2];

  int totalprice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart',style: TextStyle(color: Colors.white),),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  height: 200,
                  child: Card(
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: NetworkImage(
                            'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163641874-163641874-HC27062021_02-750-1.jpg?v=1',
                          ),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Galaxy Metal Floor Lamp ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Text(
                                '25x96x100 cm',
                                style: TextStyle(
                                  color: defaultcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        Itemnum[0]++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text('${Itemnum[0]}'),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        if (Itemnum[0] > 1) {
                                          Itemnum[0]--;
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
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemCount: 10,
                shrinkWrap: true,
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
                            (totalprice + Itemnum[0] * 2000).toString(),
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
      ),
    );
  }
}
