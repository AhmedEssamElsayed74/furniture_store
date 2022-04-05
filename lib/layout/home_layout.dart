import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/modules/user/cart/cart_layout.dart';
import 'package:furniture_store/modules/user/item/item_screen.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/modules/user/setting/setting_screen.dart';
import 'package:furniture_store/modules/user/search/search_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:hexcolor/hexcolor.dart';

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

          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      HexColor('#087083'),
                      HexColor('#087083'),
                    ],
                  )
                ),
              ),
              title: Text(
                cubit.titlesScreen[cubit.currentindex],
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
                  icon: cubit.currentindex == 0
                      ? const Icon(
                          Icons.search,
                          color: Colors.white,
                        )
                      : const Text(""),
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
      const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Image(
            image: AssetImage(
                'image/Capture.png',
            ),
          fit: BoxFit.cover,

        ),
      ),
      ListTile(
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          ShopCubit.get(context).ChangeIndex(ShopCubit.get(context).index);
        },
        leading: const Icon(
          Icons.category,
          color: Colors.black,
        ),
      ),
      myDivider(),
      ListTile(
        title: const Text(
          'Favourites',
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          ShopCubit.get(context).ChangeBottom(2);
          Navigator.pop(context);
        },
        leading: const Icon(
          Icons.favorite_outline_rounded,
          color: Colors.black,
        ),
      ),
      myDivider(),
      ListTile(
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          navigateto(context, const CartLayout());
        },
        leading: const Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
      ),
      myDivider(),
      ListTile(
        title: const Text(
          'Setting',
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          navigateto(context, SettingScreen());
        },
        leading: const Icon(
          Icons.settings,
          color: Colors.black,
        ),
      ),
      myDivider(),
      ListTile(
        title: const Text(
          'LogOut',
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          navigateAndFinish(context, LoginScreen());
        },
        leading: const Icon(
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
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              ShopCubit.get(context).ChangeIndex(ShopCubit.get(context).index);
            },
          ),
          const Text(
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
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index)=>  ListTile(
            title: Text(
              ShopCubit.get(context).categoriesItems[index],
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              navigateto(context, ItemScreen(ShopCubit.get(context).categoriesItems[index]));
            },
          ),
            separatorBuilder:  (context,index)=> myDivider(),
            itemCount:ShopCubit.get(context). categoriesItems.length,
          shrinkWrap: true,
        ),
      ),
    ];
  }
}

