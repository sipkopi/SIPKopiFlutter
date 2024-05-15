import 'package:flutter/material.dart';
import 'package:login_signup/screens/home/dashboard.dart';
import 'package:login_signup/screens/home_page.dart';
import 'package:login_signup/screens/splashscreen.dart';
import 'package:login_signup/screens/signin_screen.dart';
import 'package:login_signup/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIP Kopi',
      theme: lightMode,
      home: 
      
      SplashScreen(),
       routes: {
        '/home': (context) => SignInScreen(), 
      },
    );
  }
}
