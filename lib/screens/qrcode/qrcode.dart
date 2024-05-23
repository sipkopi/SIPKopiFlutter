import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrcodePage extends StatefulWidget {
  const QrcodePage({Key? key}) : super(key: key);

  @override
  State<QrcodePage> createState() => _QrcodePageState();
}

class _QrcodePageState extends State<QrcodePage> {
  String qrData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("QR Code Generator", style: TextStyle( color: Colors.green,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PrettyQr(
                    data: qrData,
                    image: AssetImage('assets/images/logopkm.png'),
                    size: 200,
                    errorCorrectLevel: QrErrorCorrectLevel.L,
                  ), 
                ],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Link Produk",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green), 
                ),
                hintStyle: TextStyle(color: Colors.green), 
              ),
              onChanged: (value) {
                setState(() {
                    qrData = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                            primary: Colors.green, 
                        ),
              onPressed: () {
                
              },
              child: Text('SIMPAN', style: TextStyle(color: Colors.white, fontSize: 15),),
            ),
          ]
        ),
      ),
    );
  }
}
