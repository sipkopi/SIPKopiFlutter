import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       automaticallyImplyLeading: false,
        title: Text(
          "Data Laporan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
         'Segera Hadir!',
          style: GoogleFonts.aBeeZee(fontSize: 20.0),
        ),
      ),
      
    );
  }
}
