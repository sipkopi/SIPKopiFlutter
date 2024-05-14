import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/pencatatan/panen/panen_add.dart';

class PanenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text(
          "Data Panen",
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
                    MaterialPageRoute(builder: (context) => PanenAdd()),
       );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
