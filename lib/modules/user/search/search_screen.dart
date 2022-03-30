import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/layout/home_layout.dart';
import 'package:furniture_store/shared/component/component.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultformfield(
                      controller: searchcontroller,
                      type: TextInputType.text,
                      validate: (value) {},
                      onSubmit: ()
                      {
                      },
                      label: 'search',
                      prefix: Icons.search,
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}