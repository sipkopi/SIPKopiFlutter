import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HarvestPricePage extends StatelessWidget {
  final String komoditas;
  final double hargaSaatIni;
  final String satuan;
  final String imagePath;
  final String sumber;
  final double borderRadius;

  const HarvestPricePage({
    required this.komoditas,
    required this.hargaSaatIni,
    required this.satuan,
    required this.imagePath,
    required this.sumber,
    this.borderRadius = 8.0,  // Default border radius value
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
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                height: 200,
                color: Colors.grey[200],
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Komoditas: $komoditas',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Satuan: $satuan',
              style: GoogleFonts.roboto(fontSize: 16),
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
