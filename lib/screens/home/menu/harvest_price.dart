import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HarvestPricePage extends StatelessWidget {
  final String komoditas;
  final double hargaSaatIni;
  final String imagePath;
  final String sumber;

  const HarvestPricePage({
    required this.komoditas,
    required this.hargaSaatIni,
    required this.imagePath,
    required this.sumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Card(
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              color: Colors.grey[200],
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Komoditas: $komoditas',
              style: GoogleFonts.roboto(fontSize: 18),
            ),
            SizedBox(height: 2),
            Text(
              'Harga Saat Ini: Rp ${hargaSaatIni.toStringAsFixed(0)}',
              style: GoogleFonts.roboto(fontSize: 16),
            ),
                 SizedBox(height: 4),
            Text(
              'Sumber: $sumber',
              style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
