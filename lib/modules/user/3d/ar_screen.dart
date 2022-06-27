import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/admins/product_request.dart';
import 'package:furniture_store/modules/seller%20order/orders.dart';
import 'package:furniture_store/shared/component/component.dart';

class ArScreen extends StatelessWidget {
  const ArScreen({Key? key}) : super(key: key);

  Widget BuildAr() {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Center(
                  child: defaultButton3(
                      width: 60,
                      function: () {
                        navigateto(context, ProductRequest());
                      },
                      text: 'Go')),
              SizedBox(height: 20,),
              defaultButton3(
        width: 60,
        function: () {
        navigateto(context, sellerOrders());},
        text: 'seller'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return BuildAr();
              } else {
                return BuildNoInternetWidget();
              }
            },
            child: const Center(
              child: CircularProgressIndicator(),
            )));
  }
}
