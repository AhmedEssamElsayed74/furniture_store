import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/modules/user/notification/message_notification.dart';
import 'package:furniture_store/modules/user/privacy%20%20and%20%20term/privacy_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
   const ProfileScreen({Key? key}) : super(key: key);
 

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchState = false;
  File? _image;
  final picker = ImagePicker();
  Widget BuildProfile(context)
  {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Container(
                    height: 160,
                    width: 160,
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

                CircleAvatar(
                  backgroundColor: HexColor('#13B8D6'),
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      var alert = AlertDialog(
                        title: const Text(
                          'Choose Picture From :',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        content: Container(
                          height: 150,
                          child: Column(
                            children: [
                              myDivider(),
                              Container(
                                color: HexColor('#13B8D6'),
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.image,
                                    color: Colors.white,
                                  ),
                                  title: const Text(
                                    "Gallery",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    getImage(ImageSource.gallery);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                color: HexColor('#13B8D6'),
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                  ),
                                  title: const Text(
                                    "Camera",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    getImage(ImageSource.camera);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                      );
                      showDialog(context: context, builder: (context) => alert);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Ahmed Essam",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
              ],
            ),
          ],
        ),
      ),
    );

  }
  Future getImage(ImageSource src) async {
    final takedImage = await picker.getImage(source: src);

    setState(() {
      if (takedImage != null) {
        _image = File(takedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:
        OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
                ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if(connected){
                return BuildProfile(context);
              }else
              {
                return BuildNoInternetWidget();
              }
            },
            child: const Center(child: CircularProgressIndicator(),)
        )
    );
  }



}
