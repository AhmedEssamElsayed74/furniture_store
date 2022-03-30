import 'dart:io';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/modules/user/notification/message_notification.dart';
import 'package:furniture_store/modules/user/privacy%20%20and%20%20term/privacy_screen.dart';
import 'package:furniture_store/modules/user/search/search_screen.dart';
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
            icon: Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color:  HexColor('#087083'),
              height: 100,
              width: double.infinity,
              child: Text(
                "Settings",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('LogOut'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: ()
              {
               navigateAndFinish(context, LogingScreen());
              },
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('General Setting',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),

            Row(

              children: [
                SizedBox(width: 5,),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications),
                ),
                SizedBox(width: 10,),
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
                    leading: Icon(Icons.list),
                    title: Text("Notify Messages"),
                    onTap: () {
                      navigateto(context, MessageScreen());
                    },
                    trailing: Icon(Icons.arrow_forward_ios),
                  )
                : SizedBox(height: 0),
            myDivider(),
            ListTile(
              leading: Icon(Icons.task),
              title: Text("Privacy and term"),
              onTap: () {
                 navigateto(context, PrivacyScreen());
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),


          ],
        ),
        floatingActionButton: FabCircularMenu(
        alignment: Alignment.bottomRight,
        fabOpenIcon : const Icon(Icons.chat,color: Colors.white,size: 30,),
        fabCloseIcon : const Icon(Icons.close,color: Colors.white,size: 30,),
        ringColor: HexColor('#087083'),
        fabCloseColor: HexColor('#087083'),
        fabOpenColor: HexColor('#5AB5C6'),
        ringDiameter: 350.0,
        ringWidth: 70.0,
        fabSize: 60.0,
        fabElevation: 8.0,
        fabIconBorder: CircleBorder(),
        children: <Widget>
        [
          RawMaterialButton(
            onPressed: ()
            {
              launch('tel:/01097048325');
            },
            elevation: 10.0,
            child: Icon(
              Icons.phone,
              size: 45.0,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
          ),
          RawMaterialButton(
            onPressed: ()
            {
            openwhatsapp();
            },
            elevation: 10.0,
            child:   Image(
              image: AssetImage(
                'image/whatsapp.png',

              ),
              width: 50,
              height: 50,
            ),
            padding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
          ),
          RawMaterialButton(
            onPressed: ()
            {
              launch("https://www.facebook.com/DreamHouse237/");
            },
            elevation: 10.0,
            child:Image(
              image: AssetImage(
                'image/facebook.png',

              ),
              width: 50,
              height: 50,
            ),
            padding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
          ),
        ]
    ),

    );
  }
  openwhatsapp()async
  {
    var whatsapp="0201012969083";
    var whatsUrl="whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatsurl_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(Platform.isIOS)
    {
      if(await canLaunch(whatsurl_ios)){
        await launch(whatsurl_ios);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("Whatsapp not installed")));
      }
      
      
      
    }else
    {
      if(await canLaunch(whatsUrl)){
        await launch(whatsUrl);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("Whatsapp not installed")));
      }
    }
  }
}
