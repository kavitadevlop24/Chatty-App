import 'package:chatty_app/Screens/SignUp/signupscreen.dart';
import 'package:chatty_app/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends StatefulWidget {
  const SplashController({Key? key}) : super(key: key);

  @override
  State<SplashController> createState() => _SplashControllerState();
}

class _SplashControllerState extends State<SplashController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
      if(snapshot.hasData){
          return HomeScreen();
      }
      else{
        return SignUpScreen();
      }
    });
  }
}
