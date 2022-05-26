import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/cart/cart_layout.dart';
import 'package:furniture_store/modules/user/item/item_screen.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/modules/user/profile/editprofile_screen.dart';
import 'package:furniture_store/modules/user/setting/setting_screen.dart';
import 'package:furniture_store/modules/user/search/search_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);

          return
            ZoomDrawer(
                menuScreen: DrawerScreen(),
                mainScreen: HomeScreen(),
                borderRadius: 30,
              showShadow: true,
              menuBackgroundColor:  HexColor('#087083'),
            );
        },
      ),
    );
  }




}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        leading: DrawerWidget(),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                HexColor('#087083'),
                HexColor('#5AB5C6'),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
        ),
        title: Text(
          ShopCubit.get(context).titlesScreen[ShopCubit.get(context).currentindex],
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateto(
                context,
                SearchScreen(),
              );
            },
            icon: ShopCubit.get(context).currentindex == 0
                ? const Icon(
                    Icons.search,
                    color: Colors.white,
                  )
                : const Text(""),
          ),
        ],
      ),
      body: ShopCubit.get(context).bottomscreen[ShopCubit.get(context).currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        index: ShopCubit.get(context).currentindex,
        onTap: (value) => ShopCubit.get(context).ChangeBottom(value),
        color:  HexColor('#087083'),
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
        height: 55,
        items: const
        [
           Icon(Icons.home,size: 30,color: Colors.white,),
           Icon(Icons.linked_camera_outlined,size: 30,color: Colors.white,),
           Icon(Icons.favorite_outline_rounded,size: 30,color: Colors.white,),
           Icon(Icons.person,size: 30,color: Colors.white,),
        ],
      ),
      // drawer: Drawer(
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: ShopCubit.get(context).index == 0
      //           ? getList1(context) : getList2(context),
      //
      //     ),
      //   ),
      // ),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  File? _image;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ShopCubit.get(context).index == 0
            ? getList1(context) : getList2(context),

      );

  }

  List<Widget> getList1(context) {
    return [
      SizedBox(height: 20,),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Container(
                height: 130,
                width: 130,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle
                ),
                child: _image == null
                    ? Image.network(
                    'https://lh3.googleusercontent.com/a-/AOh14GiGr_YvomQQej7O84BvUYtq53CLn53Sz07sQEv91w=s360-p-rw-no')
                    : Image.file(
                  _image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Text(
            "Ahmed Essam",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
          ],
        ),
      SizedBox(height: 50,),
      ListTile(
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          ShopCubit.get(context).ChangeIndex(ShopCubit
              .get(context)
              .index);
        },
        leading: const Icon(
          Icons.category,
          color: Colors.white,
        ),
      ),
      myDivider(),
      ListTile(
        title: const Text(
          'Favourites',
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          ShopCubit.get(context).ChangeBottom(2);
        },
        leading: const Icon(
          Icons.favorite_outline_rounded,
          color: Colors.white,
        ),
      ),
      myDivider(),
      ListTile(
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          navigateto(context, const CartLayout());
        },
        leading: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      myDivider(),
      ListTile(
        title: const Text(
          'Setting',
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          navigateto(context, SettingScreen());
        },
        leading: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
      myDivider(),
      ListTile(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          navigateto(context,  EditProfile());
        },
        leading: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      myDivider(),
      ListTile(
        title: const Text(
          'LogOut',
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          navigateAndFinish(context, LoginScreen());
        },
        leading: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    ];
  }

  List<Widget> getList2(context) {
    return [
      const SizedBox(height: 30),
      Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              ShopCubit.get(context).ChangeIndex(ShopCubit
                  .get(context)
                  .index);
            },
          ),
          const Text(
            "Category",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
      Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              ListTile(
                title: Text(
                  ShopCubit
                      .get(context)
                      .categoriesItems[index],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  navigateto(context, ItemScreen(ShopCubit
                      .get(context)
                      .categoriesItems[index]));
                },
              ),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: ShopCubit
              .get(context)
              .categoriesItems
              .length,
          shrinkWrap: true,
        ),
      ),
    ];
  }

  Future getImage(ImageSource src) async {
    final takedImage = await picker.getImage(source: src);

    setState(() {
      if (takedImage != null) {
        _image = File(takedImage.path);
      }
    });
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: ()
      {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: const Icon(Icons.menu),
    );
  }
}


