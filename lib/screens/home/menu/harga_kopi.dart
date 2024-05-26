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
              
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Menunjukkan harga untuk wilayah:',
                      style: GoogleFonts.aBeeZee(fontSize: 9.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Kecamatan Sumber Wringin, Kabupaten Bondowoso',
                      style: GoogleFonts.aBeeZee(fontSize: 12.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            HarvestPricePage(
              komoditas: 'Arabica',
              satuan: 'Biji Kering',
              hargaSaatIni: '60.000 - 125.000/kg',
              imagePath: 'assets/images/arabicaa.jpg',
              sumber: 'Sensus Pertanian BPS 2023',
            ),
            HarvestPricePage(
              komoditas: 'Robusta',
              satuan: 'Biji Kering',
              hargaSaatIni: '25.000 - 40.000/kg',
              imagePath: 'assets/images/robusta.jpg',
              sumber: 'Sensus Pertanian BPS 2023',
            ),
          ],
        ),
      ),
    );
  }
}
