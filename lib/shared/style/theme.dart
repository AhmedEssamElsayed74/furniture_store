import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_store/shared/style/color.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme=ThemeData(
  primarySwatch: defaultcolor,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('#087083'),

    statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultcolor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),

);
ThemeData lightTheme=ThemeData(
  primarySwatch: defaultcolor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:  AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor:  HexColor('#087083'),
    elevation: 0.0,
    systemOverlayStyle:  SystemUiOverlayStyle(
      statusBarColor: HexColor('#087083'),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor:Colors.white,
    unselectedItemColor: Colors.grey, // معناها ان اللي هقف عليه هيبقي اورنج والباقي رصاصي
    elevation: 35.0,
    backgroundColor: HexColor('#087083'),
  ),

);