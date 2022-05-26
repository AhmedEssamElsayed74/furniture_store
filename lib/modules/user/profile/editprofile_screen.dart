import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/layout/home_layout.dart';
import 'package:furniture_store/modules/user/profile/profile.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);


  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool switchState = false;
  File? _image;
  final picker = ImagePicker();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  Widget BuildEditProfile(context)
  {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formkey,
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
                    backgroundColor:Colors.black,
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
              const SizedBox(height: 50,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2,color: Colors.grey),
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                controller: namecontroller,
                keyboardType: TextInputType.name,
                validator:(value) {
                  if (value!.isEmpty) {
                    return 'name must not be Empty';
                  }
                } ,

              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2,color: Colors.grey),
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                validator:(value) {
                  if (value!.isEmpty) {
                    return 'Email must not be Empty';
                  }
                } ,

              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Phone",
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2,color: Colors.grey),
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                controller: phonecontroller,
                keyboardType: TextInputType.phone,
                validator:(value) {
                  if (value!.isEmpty) {
                    return 'Phone must not be Empty';
                  }
                } ,

              ),
              const SizedBox(height: 35,),
              MaterialButton(
                onPressed: ()
                {
                  if (formkey.currentState!.validate()) {
                    // navigateAndFinish(context, ProfileScreen(),);
                  }
                },

                child: const Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight:FontWeight.bold,
                  ),
                ),
                minWidth: 160,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: EdgeInsets.zero,
                color: HexColor('#087083'),
              ),





            ],
          ),
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
        title: Text("Edit Profile",style: TextStyle(color: Colors.white),),
      ),
        body:
        OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
                ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if(connected){
                return BuildEditProfile(context);
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
