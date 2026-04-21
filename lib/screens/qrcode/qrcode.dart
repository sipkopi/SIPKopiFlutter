import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:login_signup/screens/qrcode/scan.dart';
import 'package:permission_handler/permission_handler.dart';

class QrcodePage extends StatefulWidget {
  const QrcodePage({Key? key}) : super(key: key);

  @override
  State<QrcodePage> createState() => _QrcodePageState();
}

class _QrcodePageState extends State<QrcodePage> {
  String qrData = "";
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "QR Code Generator",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
        ),
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
                  Screenshot(
                    controller: screenshotController,
                    child: PrettyQr(
                      data: qrData,
                      image: AssetImage('assets/images/logopkm.png'),
                      size: 200,
                      errorCorrectLevel: QrErrorCorrectLevel.L,
                    ),
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
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                await _saveScreenshot();
              },
              child: Text(
                'SIMPAN',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          
          ],
        ),
      ),
    );
  }

  Future<void> _saveScreenshot() async {
    // Request storage permission
    if (await _requestPermission(Permission.storage)) {
      // Capture the screenshot
      screenshotController.capture().then((Uint8List? image) async {
        if (image != null) {
          // Define the directory and file path for the screenshot
          Directory? downloadsDirectory = await getExternalStorageDirectory();
          String directoryPath = '${downloadsDirectory!.path}/Download';
          Directory downloadFolder = Directory(directoryPath);

          // Create the directory if it doesn't exist
          if (!downloadFolder.existsSync()) {
            downloadFolder.createSync(recursive: true);
          }

          String filePath = path.join(downloadFolder.path, 'qr_code.png');
          File file = File(filePath);

          // Write the image data to the file
          await file.writeAsBytes(image);

          // Show a dialog to inform the user
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text("Image Saved Successfully"),
              content: Image.file(file),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            ),
          );
        }
      }).catchError((onError) {
        print(onError);
      });
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    final status = await permission.request();
    return status == PermissionStatus.granted;
  }
}
