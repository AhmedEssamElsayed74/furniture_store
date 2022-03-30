import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/3D/3D.dart';
import 'package:furniture_store/modules/user/Product/products_screen.dart';
import 'package:furniture_store/modules/user/favourite/favourite_screen.dart';
import 'package:furniture_store/modules/user/profile/profile.dart';



class ShopCubit extends Cubit<ShopStates>
{
   ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context)=>BlocProvider.of(context);

int currentindex = 0;

   int index = 0;

List<Widget>bottomscreen=
    [
      ProductScreen(),
      ArsScreen(),
      FavouriteScreen(),
      ProfileScreen(),
    ];

List<String>titlesScreen=
    [
      'Home',
      '3D',
      'Favourites',
      'Profile',
    ];
   void ChangeBottom (index)
   {
     currentindex = index;
     emit(ShopBottomNavbarState());
   }

   void ChangeIndex (ind)
   {
     index = ind==0?1:0;
     emit(ShopBottomNavbarState());
   }

   // void ChangeIndex2 (ind)
   // {
   //   index = ind==0?2:0;
   //   emit(ShopBottomNavbarState());
   // }

}