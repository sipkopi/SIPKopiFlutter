import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/home/head_home.dart';
import 'package:login_signup/widgets/custom_button.dart';
import 'package:login_signup/widgets/card_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: Padding(padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          const HeadHome(),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10), 
            child: SizedBox(
              height: 150,
              width: 420,
              child: AnotherCarousel(
                images: const [
                  AssetImage('assets/images/naray2.png'),
                  AssetImage('assets/images/conato.png'),
                  AssetImage('assets/images/orilla.png'),
                ],
                dotSize: 5,
                indicatorBgPadding: 5.0,
              ),
            ),
          ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                    key: UniqueKey(), 
                    icon: Icons.book_online,
                    text: 'Report',
                    onPressed: () {
                      // Aksi yang ingin Anda lakukan saat tombol Beranda ditekan
                      print('Tombol Beranda ditekan!');
                      },
                    ),
                    CustomButton(
                      key: UniqueKey(), 
                      icon: Icons.cloud,
                      text: 'Cuaca',
                      onPressed: () {
                        // Aksi yang ingin Anda lakukan saat tombol Pengaturan ditekan
                        print('Tombol Pengaturan ditekan!');
                      },
                    ),
                    CustomButton(
                      key: UniqueKey(), 
                      icon: Icons.schedule,
                      text: 'Schedule',
                      onPressed: () {
                        // Aksi yang ingin Anda lakukan saat tombol Notifikasi ditekan
                       print('Tombol Notifikasi ditekan!');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15), // Pindahkan SizedBox ke dalam Column
                CardWidget(
                  key: UniqueKey(), 
                  title: 'Harga Kopi',
                  icon: Icons.price_change_outlined,
                  color: Colors.brown,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}