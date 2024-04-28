import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman profil',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
