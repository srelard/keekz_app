import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keekz_app/constants/Constantcolors.dart';
import 'package:keekz_app/screens/LandingPage/landingHelpers.dart';
import 'package:keekz_app/screens/LandingPage/landingServices.dart';
import 'package:keekz_app/screens/Splashscreen/splashScreen.dart';
import 'package:keekz_app/services/authentication.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Authentication(),
        ),
        ChangeNotifierProvider(
          create: (_) => LandingHelpers(),
        ),
        ChangeNotifierProvider(
          create: (_) => LandingService(),
        ),
      ],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            accentColor: constantColors.blueColor,
            fontFamily: "Poppins",
            canvasColor: Colors.transparent),
      ),
    );
  }
}
