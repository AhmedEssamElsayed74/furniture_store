import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/3d/3D.dart';
import 'package:furniture_store/modules/user/Product/products_screen.dart';
import 'package:furniture_store/modules/user/ditals/item_modle.dart';
import 'package:furniture_store/modules/user/favourite/favourite_screen.dart';
import 'package:furniture_store/modules/user/profile/profile.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  int index = 0;

  List<Widget> bottomscreen = [
    const ProductScreen(),
    const ArScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  var Itemnum = [5, 2];

  int totalprice = 0;

  List<String> titlesScreen = [
    'Home',
    '3D',
    'Favourites',
    'Profile',
  ];

  List items = [
    'https://i.pinimg.com/736x/79/11/b9/7911b9cac1f574e675d4b5d3903207e6.jpg',
    'https://i.pinimg.com/564x/db/51/95/db519529496b547c93d1ad8b230559b0.jpg',
    'https://d13r0hznkpv24o.cloudfront.net/media/catalog/product/cache/74cf99c86332999c0c5bbe50aaa1b73c/l/e/lego_5_1.png',
    'https://i.pinimg.com/originals/ac/43/f5/ac43f531373013c83d1af9a3fddc931e.jpg',
    'https://i.pinimg.com/564x/79/d3/4e/79d34ee3f5dc45477308641955db6117.jpg',
  ];

  List categoriesItems = [
    'Bed Room',
    'Kids Room',
    'Dining Room',
    'Living Room',
    'Salon',
    'Kitchen',
    'Offices',
    'Antiques',
    'Carpets',
    'Lighting',
    'Chairs',
    'Curtains',
    'Table',
    'Out door',
    'Appliances',
  ];

  List picture = [
    'image/bedroom.png',
    'image/kids room.png',
    'image/dining room.png',
    'image/living room.png',
    'image/salon.png',
    'image/kitchen.png',
    'image/office.png',
    'image/antiques.png',
    'image/carpet.png',
    'image/lighting.png',
    'image/chair.png',
    'image/curtain.png',
    'image/tables.png',
    'image/outdoor.png',
    'image/appliances.png',
  ];

/////////////////////////////////////////////////////////////////
  List detailsPicture = [
    'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163641874-163641874-HC27062021_02-750-1.jpg?v=1',
    'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163639532-163639532-HC11102021_02-750-1.jpg',
    'https://target.scene7.com/is/image/Target/GUEST_b0aa50c3-ce9c-4fea-93bf-e6dffb91818b?wid=325&hei=325&qlt=80&fmt=pjpeg',
  ];
  ////////////////////////////////////////////////////////
  List<Product> products = [
    Product(
      'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163641874-163641874-HC27062021_02-750-1.jpg?v=1',
      'Galaxy Metal Floor Lamp',
      50000,
      5,
      '100x200x50',
    ),
    Product(
      'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163639532-163639532-HC11102021_02-750-1.jpg',
      'Piece Glass Top Coffee',
      100,
      10,
      '50x60x20',
    ),
    Product(
      'https://target.scene7.com/is/image/Target/GUEST_b0aa50c3-ce9c-4fea-93bf-e6dffb91818b?wid=325&hei=325&qlt=80&fmt=pjpeg',
      'Century Club Chair',
      2000,
      9,
      '30x30x5',
    ),
    Product(
      'https://i.pinimg.com/736x/c2/03/bb/c203bb64b6d658c34d56e485e7a11224.jpg',
      'Home Office Design',
      4000,
      10,
      '15x10x30',
    ),
    Product(
      'https://i.pinimg.com/564x/31/c3/db/31c3dbc6d38e11a452e902d8775a5aa4.jpg',
      'Tapete Sala e Quarto',
      9000,
      6,
      '18x30x60',
    ),

  ];
  bool isDark = false;

  void ChangeAppTheme() {
    isDark = !isDark;
    emit(AppChangeDarkTheme());
  }

  void ChangeBottom(index) {
    currentindex = index;
    emit(ShopBottomNavbarState());
  }

  void ChangeIndex(ind) {
    index = ind == 0 ? 1 : 0;
    emit(ShopBottomNavbarState());
  }

// void ChangeIndex2 (ind)
// {
//   index = ind==0?2:0;
//   emit(ShopBottomNavbarState());
// }

}
