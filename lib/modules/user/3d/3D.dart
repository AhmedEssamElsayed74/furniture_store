import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/shared/component/component.dart';


class ArScreen extends StatelessWidget {
  const ArScreen({Key? key}) : super(key: key);

  Widget BuildAr()
  {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
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
                return BuildAr();
              }else
              {
                return BuildNoInternetWidget();
              }
            },
            child: const Center(child: CircularProgressIndicator(),)
        )
    );  }

}



