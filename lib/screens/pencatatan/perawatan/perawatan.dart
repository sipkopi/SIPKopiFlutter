import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/pencatatan/perawatan/perawatan_add.dart';

class PerawatanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text(
          "Data Perawatan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
         'Data Kosong!',
          style: GoogleFonts.aBeeZee(fontSize: 20.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PerawatanAdd()),
       );
        },
        child: Icon(Icons.add),
        
      ),
    );
  }
}
