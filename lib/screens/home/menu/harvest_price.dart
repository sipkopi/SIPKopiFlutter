import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HarvestPricePage extends StatelessWidget {
  final String komoditas;
  final String hargaSaatIni;
  final String satuan;
  final String sumber;
  final double borderRadius;

  const HarvestPricePage({
    required this.komoditas,
    required this.hargaSaatIni,
    required this.satuan,
    required this.sumber,
    this.borderRadius = 8.0, 
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
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.local_cafe, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Komoditas: $komoditas',
                  style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.scale, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Satuan: $satuan',
                  style: GoogleFonts.roboto(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Harga Saat ini: $hargaSaatIni',
                  style: GoogleFonts.roboto(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.info_outline, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Sumber: $sumber',
                  style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
