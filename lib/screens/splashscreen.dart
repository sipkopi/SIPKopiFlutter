import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       Timer(Duration(seconds: 3), () {
      // Navigasi ke layar utama setelah 3 detik
      Navigator.of(context).pushReplacementNamed('/home');
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logopkm.png'), 
      ),
    );
  }
}
