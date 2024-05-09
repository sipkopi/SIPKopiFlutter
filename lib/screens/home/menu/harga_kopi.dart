import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/home/menu/harvest_price.dart';

class HargaKopi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Harga Kopi",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Informasi Harga Kopi',
                style: GoogleFonts.aBeeZee(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 20),
            // Menambahkan halaman informasi harga kopi yang telah dibuat sebelumnya
            HarvestPricePage(
              komoditas: 'Arabica',
              hargaSaatIni: 30000.0,
              imagePath: 'assets/images/artikel5.jpg',
              sumber: 'Sensus Pertanian BPS 2023',
            ),
            HarvestPricePage(
              komoditas: 'Robusta',
              hargaSaatIni: 25000.0,
              imagePath: 'assets/images/artikel4.jpg',
              sumber: 'Sensus Pertanian BPS 2023',
            ),
          ],
        ),
      ),
    );
  }
}