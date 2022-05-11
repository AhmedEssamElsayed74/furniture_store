import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/modules/user/password/code_screen.dart';
import 'package:furniture_store/shared/component/component.dart';

class EmailScreen extends StatelessWidget {
   EmailScreen({Key? key}) : super(key: key);

  var emailcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

   ConnectivityResult result = ConnectivityResult.none;
   Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Find Your Account",
          style: TextStyle(
            fontSize: 20,
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
              const Text(
                "Enter your email address",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 40,),

              defaultformfield(
                controller: emailcontroller,
                type: TextInputType.emailAddress,
                validate: (value)
                {
                  if(value.isEmpty)
                  {
                    return 'Email must not be Empty';
                  }else
                  {
                    return null;
                  }
                },
                label: 'Email Address',
                prefix: Icons.email,
              ),

              const SizedBox(height: 40.0,),
              Center(
                child:
                defaultButton(function:
                  ()async
              {
                result = await connectivity.checkConnectivity();
                if(result==ConnectivityResult.mobile)
                {
                  if (formkey.currentState!.validate())
                  {
                    navigateto(context, CodeScreen());
                    showToast(text: "Check your email account", state: ToastState.SUCCESS);

                  }

                }else if (result==ConnectivityResult.wifi)
                {
                  if (formkey.currentState!.validate())
                  {
                    navigateto(context, CodeScreen());
                    showToast(text: "Check your email account", state: ToastState.SUCCESS);

                  }

                }else
                {
                  showToast(text: "Please check your connection", state: ToastState.ERROR);

                }

              },
                text: 'Continue',
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
