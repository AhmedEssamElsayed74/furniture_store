import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/shared/component/component.dart';


class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);

  var passwordcontroller = TextEditingController();
  var newpasswordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  ConnectivityResult result = ConnectivityResult.none;
  Connectivity connectivity = Connectivity();




  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              defaultformfield(
                controller: passwordcontroller,
                type: TextInputType.text,
                validate: (value)
                {
                  if(value.isEmpty)
                  {
                    return 'password must not be empty';
                  }else
                  {
                    return null;
                  }
                },
                label: 'new password',
                prefix: Icons.lock_outline_rounded,
              ),
              const SizedBox(height: 20.0,),
              defaultformfield(
                controller: newpasswordcontroller,
                type: TextInputType.text,
                validate: (value)
                {
                  if(value.isEmpty)
                  {
                    return 'password must not be empty';
                  }else
                  {
                    return null;
                  }
                },
                label: 'confirm password',
                prefix: Icons.lock_outline_rounded,
              ),

              const SizedBox(height: 40.0,),
              Center(child: defaultButton(function:
                  ()async
              {
                result = await connectivity.checkConnectivity();
                if(result==ConnectivityResult.mobile)
                {
                  if (formkey.currentState!.validate()) {
                    navigateAndFinish(context, LoginScreen());

                  }
                }else if (result==ConnectivityResult.wifi)
                {
                  if (formkey.currentState!.validate()) {
                    navigateAndFinish(context, LoginScreen());

                  }

                }else
                {
                  showToast(text: "Please check your connection", state: ToastState.ERROR);

                }
              },
                text: 'confirm',
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }


}