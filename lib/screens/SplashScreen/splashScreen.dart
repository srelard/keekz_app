import 'dart:async';
import 'package:flutter/material.dart';
import 'package:keekz_app/constants/Constantcolors.dart';
import 'package:keekz_app/screens/LandingPage/landingPage.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ConstantColors constantColors = ConstantColors();

  @override
  void initState() {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: LandingPage(), type: PageTransitionType.fade)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: Center(
        child: RichText(
          text: TextSpan(
            text: "Keekz",
            style: TextStyle(
                fontFamily: "Poppins",
                color: constantColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 30),
            children: <TextSpan>[
              TextSpan(
                  text: "Experiences",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      color: constantColors.blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 34))
            ],
          ),
        ),
      ),
    );
  }
}
