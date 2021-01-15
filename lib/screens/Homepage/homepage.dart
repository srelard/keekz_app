import 'package:flutter/material.dart';
import 'package:keekz_app/constants/Constantcolors.dart';

class Homepage extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.whiteColor,
    );
  }
}
