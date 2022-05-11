import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/modules/user/password/newpassword_screen.dart';
import 'package:furniture_store/shared/component/component.dart';

class CodeScreen extends StatelessWidget {
   CodeScreen({Key? key}) : super(key: key);

  var codecontroller = TextEditingController();
   var formkey = GlobalKey<FormState>();

   ConnectivityResult result = ConnectivityResult.none;
   Connectivity connectivity = Connectivity();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Confirm Your Account",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Enter the code that we sent to you",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40,),

               TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Your Code",
                ),
                controller: codecontroller,
                maxLength: 6,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                 validator: (value)
                 {
                   if(value!.isEmpty)
                   {
                     return 'Code must not be Empty';
                   }else
                   {
                     return null;
                   }
                 },


              ),

              const SizedBox(height: 40.0,),
              Center(
                child:
                defaultButton(function:
                    () async
                {
                  result = await connectivity.checkConnectivity();
                  if(result==ConnectivityResult.mobile)
                  {
                    if(formkey.currentState!.validate())
                    {
                      navigateto(context, NewPasswordScreen());
                    }

                  }else if (result==ConnectivityResult.wifi)
                  {
                    if(formkey.currentState!.validate())
                    {
                      navigateto(context, NewPasswordScreen());
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
