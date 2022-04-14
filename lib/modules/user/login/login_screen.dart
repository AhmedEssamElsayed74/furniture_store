import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/home_layout.dart';
import 'package:furniture_store/modules/user/login/cubit/cubit.dart';
import 'package:furniture_store/modules/user/login/cubit/states.dart';
import 'package:furniture_store/modules/user/password/newpassword_screen.dart';
import 'package:furniture_store/modules/user/register/register_screen.dart';
import 'package:furniture_store/shared/component/component.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogingCubit(),
      child: BlocConsumer<LogingCubit, Logingstates>(
        listener: (context, state) {
          if (state is LogingErrorstate) {
            showToast(
              text: state.error,
              state: ToastState.ERROR,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                            child: Image(
                              image: AssetImage('image/login.gif',),
                          width: 250,
                          height: 200,
                        ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Center(
                          child: Text(
                            'Login ',
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
                          height: 30.0,
                        ),
                        defaultformfield(
                          controller: passwordcontroller,
                          type: TextInputType.visiblePassword,
                          suffix: LogingCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formkey.currentState!.validate()) {
                                password: passwordcontroller.text;
                            }
                          },
                          suffixPressed: (value) {
                            LogingCubit.get(context).changepassword();
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'password must not be empity';
                            }
                          },
                          isPassword: LogingCubit.get(context).isPassword,
                          label: 'password',
                          prefix: Icons.lock_outline_rounded,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextButton(
                          function: () {
                            navigateto(
                              context,
                              NewPasswordScreen(),
                            );
                          },
                          text: 'Forget Password ?',
                        ),
                        ConditionalBuilder(
                          condition: state is! LogingLoadingstate,
                          builder: (context) => Center(
                            child: defaultButton(
                              function: () {
                                if (formkey.currentState!.validate()) {
                                  navigateto(
                                    context,
                                    const ShopLayout(),
                                  );
                                }

                              },
                              text: 'sign in',
                              isUppercase: true,
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 2,
                                color: Colors.grey[300],
                              ),
                              const Text(
                                'OR',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 2,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                        ),

                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {  },
                                icon: const Image(
                                  image: AssetImage(
                                    'image/face.png',
                                  ),
                                  width: 26,
                                ),

                              ),

                              IconButton(
                                onPressed: () {  },
                                icon: const Image(
                                    image: AssetImage(
                                        'image/google.png',
                                    ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?',
                              ),
                              defaultTextButton(
                                function: () {
                                  navigateto(context, RegisterScreen());
                                },
                                text: 'sign up',
                              ),
                            ],
                          ),
                        ),
                      ],
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
