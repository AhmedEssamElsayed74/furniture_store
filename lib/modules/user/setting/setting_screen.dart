import 'dart:io';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/modules/user/notification/message_notification.dart';
import 'package:furniture_store/modules/user/privacy%20%20and%20%20term/privacy_screen.dart';
import 'package:furniture_store/modules/user/profile/editprofile_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool switchState = false;

  Widget BuildSetting() {
    return Scaffold(
      appBar: AppBar(
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Center(
                  child: Image(
                    image: AssetImage('image/settings.gif'),
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 15,),
                const Center(
                  child: Text(
                    'General Setting',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('LogOut'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    navigateAndFinish(context, LoginScreen());
                  },
                ),
                myDivider(),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.notifications),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SwitchListTile(
                        title: const Text("Notification"),
                        value: switchState,
                        onChanged: (value) {
                          setState(() {
                            switchState = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                myDivider(),
                switchState == true
                    ? ListTile(
                        leading: const Icon(Icons.list),
                        title: const Text("Notify Messages"),
                        onTap: () {
                          navigateto(context, const MessageScreen());
                        },
                        trailing: const Icon(Icons.arrow_forward_ios),
                      )
                    : const SizedBox(height: 0),
                myDivider(),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Edit Profile'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    navigateto(context, EditProfile());
                  },
                ),
                myDivider(),
                ListTile(
                  leading: const Icon(Icons.task),
                  title: const Text("Privacy and term"),
                  onTap: () {
                    navigateto(context, const PrivacyScreen());
                  },
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                myDivider(),
                Row(
                  children: [
                    const SizedBox(
                      width: 70,
                    ),
                    const Text(
                      "Dark mode",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          ShopCubit.get(context).ChangeAppTheme();
                        },
                        icon: const Icon(Icons.brightness_4_outlined))
                  ],
                ),
                myDivider(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FabCircularMenu(
          alignment: Alignment.bottomRight,
          fabOpenIcon: const Icon(
            Icons.chat,
            color: Colors.white,
            size: 30,
          ),
          fabCloseIcon: const Icon(
            Icons.close,
            color: Colors.white,
            size: 30,
          ),
          ringColor: HexColor('#087083'),
          fabCloseColor: HexColor('#087083'),
          fabOpenColor: HexColor('#5AB5C6'),
          ringDiameter: 350.0,
          ringWidth: 70.0,
          fabSize: 60.0,
          fabElevation: 8.0,
          fabIconBorder: const CircleBorder(),
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                launch('tel:/01097048325');
              },
              elevation: 10.0,
              child: const Icon(
                Icons.phone,
                size: 45.0,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(10.0),
              shape: const CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {
                openwhatsapp();
              },
              elevation: 10.0,
              child: const Image(
                image: AssetImage(
                  'image/whatsapp.png',
                ),
                width: 50,
                height: 50,
              ),
              padding: const EdgeInsets.all(10.0),
              shape: const CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {
                launch("https://www.facebook.com/DreamHouse237/");
              },
              elevation: 10.0,
              child: const Image(
                image: AssetImage(
                  'image/facebook.png',
                ),
                width: 50,
                height: 50,
              ),
              padding: const EdgeInsets.all(10.0),
              shape: const CircleBorder(),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return BuildSetting();
              } else {
                return BuildNoInternetWidget();
              }
            },
            child: const Center(
              child: CircularProgressIndicator(),
            )));
  }

  openwhatsapp() async {
    var whatsapp = "0201012969083";
    var whatsUrl = "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatsurl_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      if (await canLaunch(whatsurl_ios)) {
        await launch(whatsurl_ios);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("Whatsapp not installed")));
      }
    } else {
      if (await canLaunch(whatsUrl)) {
        await launch(whatsUrl);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("Whatsapp not installed")));
      }
    }
  }
}
