import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:leader/main.dart';
import 'package:leader/screens/login_screen.dart';

class SplashScreen extends StatefulWidget{
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
        builder: (context) => LoginScreen(),
        ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: 1000,
        child: Image.asset("assets/leader.png"),
        color: Colors.white,
      ),
    );
  }

}