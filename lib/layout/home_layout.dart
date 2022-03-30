import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/cart_layout/cart_layout.dart';
import 'package:furniture_store/modules/user/item/item_screen.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/modules/user/setting/setting_screen.dart';
import 'package:furniture_store/modules/user/search/search_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:hexcolor/hexcolor.dart';

class ShopLayout extends StatelessWidget {
  ShopLayout({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                cubit.titlesScreen[cubit.currentindex],
                style: TextStyle(
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
                  icon: cubit.currentindex == 0
                      ? Icon(
                          Icons.search,
                          color: Colors.white,
                        )
                      : Text(""),
                ),
              ],
            ),
            body: cubit.bottomscreen[cubit.currentindex],

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: ShopCubit.get(context).currentindex,
              onTap: (value) => ShopCubit.get(context).ChangeBottom(value),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.shopping_cart,
                //   ),
                //   label: 'Cart',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.linked_camera_outlined,
                  ),
                  label: '3D',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_outline_rounded,
                  ),
                  label: 'Favourites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
            drawer: Drawer(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ShopCubit.get(context).index == 0
                      ? getList1(context)
                      : getList2(context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> getList1(context) {
    return [
      Container(
        height: 250,
        child: Center(
            child: Image(
                image: NetworkImage(
                    'https://dcassetcdn.com/design_img/3642209/41418/41418_20429874_3642209_a702864e_image.jpg'))),
      ),
      ListTile(
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          ShopCubit.get(context).ChangeIndex(ShopCubit.get(context).index);
        },
        leading: Icon(
          Icons.category,
          color: Colors.black,
        ),
      ),
      myDivider(),
      ListTile(
        title: Text(
          'Favourites',
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          ShopCubit.get(context).ChangeBottom(2);
          Navigator.pop(context);
        },
        leading: Icon(
          Icons.favorite_outline_rounded,
          color: Colors.black,
        ),
      ),
      myDivider(),
      ListTile(
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          navigateto(context, CartLayout());
        },
        leading: Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
      ),
      myDivider(),
      ListTile(
        title: Text(
          'Setting',
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          navigateto(context, SettingScreen());
        },
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
      ),
      myDivider(),
      ListTile(
        title: Text(
          'LogOut',
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          navigateAndFinish(context, LogingScreen());
        },
        leading: Icon(
          Icons.logout,
          color: Colors.black,
        ),
      ),
    ];
  }

  List<Widget> getList2(context) {
    return [
      const SizedBox(height: 15),
      Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              ShopCubit.get(context).ChangeIndex(ShopCubit.get(context).index);
            },
          ),
          Text(
            "Category",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
      Expanded(
        child: ListView.separated(
            itemBuilder: (context,index)=>  ListTile(
            title: Text(
              categoriesItems[index],
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              navigateto(context, ItemScreen(categoriesItems[index]));
            },
          ),
            separatorBuilder:  (context,index)=> myDivider(),
            itemCount: categoriesItems.length,
          shrinkWrap: true,
        ),
      ),
    ];
  }
}
