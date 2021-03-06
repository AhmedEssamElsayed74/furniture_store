import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/shared/component/component.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({Key? key}) : super(key: key);

  var firstnamecontroller = TextEditingController();

  var lastnamecontroller = TextEditingController();

  var emailcontroller = TextEditingController();

  var addresscontroller = TextEditingController();

  var phonecontroller = TextEditingController();

  var cardcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();

  Widget BuildCheckout()
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  defaultformfield(
                    controller: firstnamecontroller,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'firstname must not be empty';
                      }
                    },
                    label: 'First Name',
                    prefix: Icons.person,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultformfield(
                    controller: lastnamecontroller,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'lastname must not be empty';
                      }
                    },
                    label: 'Last Name',
                    prefix: Icons.person,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultformfield(
                    controller: emailcontroller,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'email must not be empty';
                      }
                    },
                    label: 'Email Address',
                    prefix: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultformfield(
                    controller: addresscontroller,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'email must not be empty';
                      }
                    },
                    label: 'Address',
                    prefix: Icons.home,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultformfield(
                    controller: phonecontroller,
                    type: TextInputType.phone,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'phone must not be empity';
                      }
                    },
                    label: 'Phone',
                    prefix: Icons.phone,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ConditionalBuilder(
                    condition: true,
                    builder: (context) => Center(
                      child: defaultButton(
                        function: () {

                          if (formkey.currentState!.validate())
                          {
                            var alert = AlertDialog(
                              content: Container(
                                height: 200,
                                child: Column(
                                  children: const [
                                    Image(
                                      image: AssetImage('image/true.png'),
                                      width: 80,
                                      height: 60,
                                    ),
                                    SizedBox(height: 10,),
                                    Text('Success',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(height: 35,),
                                    Text('waah,you have Successfully',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );
                            showDialog(context: context, builder: (context) => alert);
                          }
                        },
                        text: 'Confirm',
                      ),
                    ),
                    fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
        OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
                ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if(connected){
                return BuildCheckout();
              }else
              {
                return BuildNoInternetWidget();
              }
            },
            child: const Center(child: CircularProgressIndicator(),)
        )
    );  }
}
