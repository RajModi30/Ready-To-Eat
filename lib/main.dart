import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoppuneet/firebase/auth.dart';
import 'package:shoppuneet/screens/home/BottomNavigation.dart';
import 'package:shoppuneet/screens/home/home_screen.dart';
import 'package:shoppuneet/screens/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

// import 'package:shoppuneet/home/home_screen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
  // @override
  // Widget build(BuildContext context) {
  //   return AnimatedSplashScreen(
  //     splash: 'assets/images/logo.png',
  //     duration: 2,
  //     // nextScreen: MainScreen(),
  //     nextScreen: user == null ? MyLogin() : BottomNavigation(),
  //     splashTransition: SplashTransition.rotationTransition,
  //     // pageTransitionType: PageTransitionType.scale,
  //   );
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyLogin()
      home: user == null ? MyLogin() : BottomNavigation() 
    );
  }
}

