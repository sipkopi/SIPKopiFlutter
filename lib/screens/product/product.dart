import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman produksi',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
