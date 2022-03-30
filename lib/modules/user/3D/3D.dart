import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/shared/component/component.dart';


class ArsScreen extends StatelessWidget {
  ArsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
        );
      },
    );
  }

}



