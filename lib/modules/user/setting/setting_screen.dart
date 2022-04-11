import 'dart:io';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/modules/user/notification/message_notification.dart';
import 'package:furniture_store/modules/user/privacy%20%20and%20%20term/privacy_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: HexColor('#087083'),
            height: 100,
            width: double.infinity,
            child: const Text(
              "Settings",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('LogOut'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              navigateAndFinish(context, LoginScreen());
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'General Setting',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
              SizedBox(width: 70,),

              Text("Dark mode",style: TextStyle(fontSize: 18,),),
              Spacer(),
              IconButton(
                  onPressed: () {
                    ShopCubit.get(context).ChangeAppTheme();
                  },
                  icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          myDivider(),
        ],
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
