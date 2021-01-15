import 'package:flutter/material.dart';
import 'package:keekz_app/constants/Constantcolors.dart';
import 'package:keekz_app/screens/Homepage/homepage.dart';
import 'package:keekz_app/screens/LandingPage/landingServices.dart';
import 'package:keekz_app/services/authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LandingHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      //decoration: BoxDecoration(
      //    image: DecorationImage(image: AssetImage("assets/images/login.png"))),
    );
  }

  Widget taglineText(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: 30,
        child: Container(
          constraints: BoxConstraints(maxWidth: 350),
          child: RichText(
            text: TextSpan(
              text: "Bist",
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: constantColors.blueGreyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
              children: <TextSpan>[
                TextSpan(
                    text: " Du ",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
                TextSpan(
                    text: "bereit ",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
                TextSpan(
                    text: "zum ",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
                TextSpan(
                    text: "Erkunden ",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: constantColors.whiteColor,
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

  Widget mainButton(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.8,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  emailAuthSheet(context);
                },
                child: Container(
                  child: Icon(
                    Icons.email_outlined,
                    color: constantColors.whiteColor,
                  ),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: constantColors.whiteColor,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("SignIn with Google");
                  Provider.of<Authentication>(context, listen: false)
                      .signInWithGoogle()
                      .whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: Homepage(),
                            type: PageTransitionType.leftToRight));
                  });
                },
                child: Container(
                  child: Icon(
                    Icons.person,
                    color: constantColors.whiteColor,
                  ),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: constantColors.whiteColor,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ));
  }

  Widget privacyText(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.95,
      left: 20,
      right: 20,
      child: Container(
          child: Column(children: [
        Text("By continuing you agree the Keekz's Terms of ",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        Text("Services & Privacy Policy",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12))
      ])),
    );
  }

  emailAuthSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 4,
                    color: constantColors.whiteColor,
                  ),
                ),
                Provider.of<LandingService>(context, listen: false)
                    .passwordLessSignIn(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      color: constantColors.stateBlue,
                      child: Text("Log in",
                          style: TextStyle(
                              color: constantColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Provider.of<LandingService>(context, listen: false)
                            .logInSheet(context);
                      },
                    ),
                    MaterialButton(
                      color: constantColors.stateBlue,
                      child: Text("Sign in",
                          style: TextStyle(
                              color: constantColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Provider.of<LandingService>(context, listen: false)
                            .logInSheet(context);
                      },
                    )
                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: constantColors.blueGreyColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          );
        });
  }
}
