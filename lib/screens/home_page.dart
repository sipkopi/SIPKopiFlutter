import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:login_signup/screens/home/dashboard.dart';
import 'package:login_signup/screens/pencatatan/pencatatan.dart';
import 'package:login_signup/screens/profile/profile.dart';
import 'package:login_signup/screens/qrcode/qrcode.dart';
import 'package:login_signup/screens/product/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    DashboardPage(),
    ProductPage(),
    PencatatanPage(),
    QrcodePage(),
    ProfilePage(),
  ];
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.green,
        color: Colors.green,
        animationDuration: const Duration(milliseconds: 200),
        items: const <Widget>[
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon(Icons.production_quantity_limits, size: 26, color: Colors.white),
          Icon(Icons.note_alt, size: 26, color: Colors.white),
          Icon(Icons.qr_code, size: 26, color: Colors.white),
      
          Icon(Icons.person, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pages[_page],
    );
  }
}
