import 'package:flutter/cupertino.dart';
import 'package:keekz_app/constants/Constantcolors.dart';

class LandingHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/login.png"))),
    );
  }

  Widget taglineText(BuildContext context) {
    return Positioned(
        top: 550,
        left: 10,
        child: Container(
          constraints: BoxConstraints(maxWidth: 170),
          child: RichText(
            text: TextSpan(
              text: "Are",
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: constantColors.blueGreyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
              children: <TextSpan>[
                TextSpan(
                    text: "You ",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: constantColors.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
                TextSpan(
                    text: "Ready",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: constantColors.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
                TextSpan(
                    text: "?",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: constantColors.blueGreyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40))
              ],
            ),
          ),
        ));
  }
}
