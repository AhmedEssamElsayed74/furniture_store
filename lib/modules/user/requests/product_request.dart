import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/requests/details_product.dart';
import 'package:furniture_store/shared/component/component.dart';

class ProductRequest extends StatelessWidget {
  ProductRequest({Key? key}) : super(key: key);

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Orders',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    SizedBox(width: 10,),
                    Text(
                        'User name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 70,),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 50,),
                    Expanded(
                      child: Text(
                        'N.order',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),


                  ],

                ),
                const SizedBox(height: 10,),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => builditem(context, index),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: ShopCubit.get(context).email.length),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget builditem(context, index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        navigateto(
          context,
          DetailsProduct(ShopCubit
              .get(context)
              .names[index]),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${ShopCubit.get(context).names[index]}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              '${ShopCubit.get(context).email[index]}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            width: 35,
          ),
          Text(
            '${ShopCubit.get(context).productcount[index]}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            width: 25,
          ),
        ],
      ),
    ),
  );
}
