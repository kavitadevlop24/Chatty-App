import 'dart:async';

import 'package:chatty_app/Screens/Splash/splashcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4),(){
      Get.offAll(SplashController());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat,size: 100,),
          SizedBox(height: 15),
          Text("Chat App",style: TextStyle(fontSize: 13),),
        ],
      ),),
    );
  }
}
