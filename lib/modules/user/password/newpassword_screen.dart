import 'package:flutter/material.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/shared/component/component.dart';


class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);

  var passwordcontroller = TextEditingController();



  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigateAndFinish(context, LogingScreen());
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Change Password',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
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
                label: 'password',
                prefix: Icons.lock_outline_rounded,
            ),
            SizedBox(height: 20.0,),
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

            SizedBox(height: 40.0,),
            Center(child: defaultButton(function: (){}, text: 'confirm',)),

          ],
        ),
      ),
    );
  }


}