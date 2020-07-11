import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nineye/screens/home.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
            () => Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context){
                return Home();
              }
            ))
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("images/logo.jpg")
      ),
    );
  }
}
