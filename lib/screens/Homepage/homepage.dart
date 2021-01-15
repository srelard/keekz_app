import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:keekz_app/constants/Constantcolors.dart';
import 'package:tinder_swipecard/tinder_swipecard.dart';

class Homepage extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.whiteColor,
      body: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TinderSwipeCard(
          demoProfiles: demoProfiles,
          myCallback: (decision) {},
        ),
      ),
    );
  }
}

class Profile {
  final List<String> photos;
  final String name;
  final String bio;

  Profile({this.photos, this.name, this.bio});
}

//dummy data
final List<Profile> demoProfiles = [
  Profile(
    photos: [
      "https://images.pexels.com/photos/1661564/pexels-photo-1661564.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=640",
      "https://images.pexels.com/photos/1696586/pexels-photo-1696586.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    ],
    name: "Schlittschuhlaufen!!!",
    bio:
        "Do you believe in love at first sight – or should you swipe right again?",
  ),
  Profile(
    photos: [
      "https://images.pexels.com/photos/2016572/pexels-photo-2016572.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=640",
      "https://unsplash.com/photos/UrYLlff6U60/download?force=true&w=640",
    ],
    name: "Skifahren mit der Familie",
    bio: "Last time I was someone’s type, I was donating blood.",
  ),
  Profile(
    photos: [
      "https://images.pexels.com/photos/6138033/pexels-photo-6138033.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://unsplash.com/photos/p5SXRTjaPTc/download?force=true&w=640",
    ],
    name: "Rodeln im Wald",
    bio:
        "I’d tell you a lengthy description about myself but that would take away from the mystery.",
  ),
];
