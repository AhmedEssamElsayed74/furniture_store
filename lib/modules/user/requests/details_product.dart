import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/ditals/ditals_screen.dart';
import 'package:furniture_store/modules/user/favourite/favourite_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsProduct extends StatelessWidget {
  final String title;

   const DetailsProduct(this.title);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              title,
              style: const TextStyle(
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
                      GestureDetector(
                          onTap: ()
                          {
                            navigateto(context, const DetailsScreen());
                          },
                          child: buildListProductItem2()
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 1,
                  ),
                  itemCount: 3,
                ),
                const SizedBox(height: 15,),
                MaterialButton(
                  onPressed: (){},

                  child: const Text(
                    'Send',
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
