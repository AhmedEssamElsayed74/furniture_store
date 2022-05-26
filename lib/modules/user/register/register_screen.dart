import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:furniture_store/modules/user/privacy%20%20and%20%20term/privacy_screen.dart';
import 'package:furniture_store/modules/user/register/cubit/cubit.dart';
import 'package:furniture_store/modules/user/register/cubit/states.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();

  ConnectivityResult result = ConnectivityResult.none;
  Connectivity connectivity = Connectivity();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, Registerstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Center(
                            child:Image(
                              image: AssetImage('image/register.gif'),
                              width: 180,
                              height: 180,
                            ),
                          ),

                          const SizedBox(
                            height: 15.0,
                          ),
                          const Center(
                            child: Text(
                              'Register ',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          defaultformfield(
                            controller: namecontroller,
                            type: TextInputType.name,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'name must not be Empty';
                              }
                            },
                            label: 'User Name',
                            prefix: Icons.person,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultformfield(
                            controller: emailcontroller,
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'email must not be Empty';
                              }
                            },
                            label: 'Email Address',
                            prefix: Icons.email_outlined,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultformfield(
                            controller: passwordcontroller,
                            type: TextInputType.visiblePassword,
                            suffix: RegisterCubit.get(context).suffix,
                            onSubmit: (value) {},
                            suffixPressed: (value) {
                              RegisterCubit.get(context).changepassword();
                            },
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'password must not be Empty';
                              }
                            },
                            isPassword: RegisterCubit.get(context).isPassword,
                            label: 'password',
                            prefix: Icons.lock_outline_rounded,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultformfield(
                            controller: phonecontroller,
                            type: TextInputType.phone,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'phone must not be Empty';
                              }
                            },
                            label: 'phone',
                            prefix: Icons.phone,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:
                            [
                              Checkbox(value: cubit.privacy,

                                onChanged: (value)
                                {
                                  cubit.changeprivacy();
                                },

                              ),
                              const SizedBox(width: 2,),
                              const Text("I agree with"),
                              TextButton(onPressed: (){
                                navigateto(context, const PrivacyScreen());
                              }, child: const Text("Privacy and Terms")),

                            ],

                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: true,
                                    groupValue: cubit.values,
                                    onChanged: (bool? value) {

                                      cubit.changevalue();

                                    },
                                  ),
                                  const SizedBox(
                                    width: 0.0,
                                  ),
                                  const Text('User'),
                                  const SizedBox(
                                    width: 60.0,
                                  ),
                                  Radio(
                                    value: false,
                                    groupValue: cubit.values,
                                    onChanged: (bool? value) {

                                      cubit.changevalue() ;
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  const Text('Seller'),
                                ],
                              ),
                            ],
                          ),


                          const SizedBox(
                            height: 10.0,
                          ),
                          ConditionalBuilder(
                            condition: state is! RegisterLoadingstate,
                            builder: (context) => Center(
                              child: defaultButton(
                                function: ()async {

                                  result = await connectivity.checkConnectivity();
                                  if(result==ConnectivityResult.mobile)
                                  {
                                     if (formkey.currentState!.validate())
                                     {
                                       if(cubit.privacy==true) {
                                         navigateAndFinish(context, LoginScreen(),);
                                       }
                                  }


                                  }else if (result==ConnectivityResult.wifi)
                                  {
                                    if (formkey.currentState!.validate())
                                    {
                                      if(cubit.privacy==true) {
                                        navigateAndFinish(context, LoginScreen(),);
                                      }else
                                      {
                                        showToast(text: "must agree to privacy and terms", state: ToastState.ERROR);
                                      }
                                    }


                                  }else
                                  {
                                    showToast(text: "Please check your connection", state: ToastState.ERROR);

                                  }


                                },
                                text: 'Register',
                                isUppercase: true,
                              ),
                            ),
                            fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(height: 15,),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account ?',
                                ),
                                defaultTextButton(function: () {
                                  navigateAndFinish(context, LoginScreen());
                                },
                                  text: 'sign in',),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
