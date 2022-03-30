import 'dart:io';
import 'package:flutter/material.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/modules/user/notification/message_notification.dart';
import 'package:furniture_store/modules/user/privacy%20%20and%20%20term/privacy_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //dynamic file;
  bool switchState = false;
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
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
                    decoration: BoxDecoration(
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
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // imagepacker();
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
                                  leading: Icon(
                                    Icons.image,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "Gallery",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    getImage(ImageSource.gallery);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                color: HexColor('#13B8D6'),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                  ),
                                  title: Text(
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
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Ahmed Essam",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('LogOut'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    navigateAndFinish(context, LogingScreen());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                    SizedBox(
                      width: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.notifications),
                    ),
                    SizedBox(
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
          ],
        ),
      ),
    );
  }

  // void imagepacker()async
  // {
  // XFile? image = await ImagePicker().pickImage(source:ImageSource.gallery);
  // if(image!=null)
  // {
  //   setState(() {
  //     file=File(image.path);
  //   });
  // }
  // }

  Future getImage(ImageSource src) async {
    final takedImage = await picker.getImage(source: src);

    setState(() {
      if (takedImage != null) {
        _image = File(takedImage.path);
      }
    });
  }
}
