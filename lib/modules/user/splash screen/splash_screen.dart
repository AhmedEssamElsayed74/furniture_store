import 'dart:async';
import 'package:flutter/material.dart';
import 'package:furniture_store/modules/user/login/login_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
        ()=>Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=>
            LoginScreen()
        ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#5AB5C6'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: const [
              Image(
                  image: AssetImage('image/Capture.png'),
                width: double.infinity,
              ),
            ],
          ),
          const CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
