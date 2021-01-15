import 'package:flutter/material.dart';
import 'package:keekz_app/constants/Constantcolors.dart';
import 'package:keekz_app/screens/LandingPage/landingHelpers.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.whiteColor,
      body: Stack(
        children: [
          bodyColor(),
          Provider.of<LandingHelpers>(context, listen: false)
              .bodyImage(context),
          Provider.of<LandingHelpers>(context, listen: false)
              .taglineText(context),
          Provider.of<LandingHelpers>(context, listen: false)
              .mainButton(context),
          Provider.of<LandingHelpers>(context, listen: false)
              .privacyText(context),
        ],
      ),
    );
  }

  bodyColor() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
            0.1,
            0.4
          ],
              colors: [
            constantColors.keekzOrange,
            constantColors.keekzOrange
          ])),
    );
  }
}
