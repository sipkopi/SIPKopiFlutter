import 'package:flutter/material.dart';
import 'package:login_signup/widgets/custom_textfield.dart';
import 'package:login_signup/widgets/custom_datepicker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PanenAdd extends StatefulWidget {
  @override
  _PanenAddState createState() => _PanenAddState();
}

class _PanenAddState extends State<PanenAdd> {
  final TextEditingController kodeController = TextEditingController();
  final TextEditingController varietasController = TextEditingController();
  final TextEditingController metodePengolahanController = TextEditingController();
  final TextEditingController beratController = TextEditingController();
  final TextEditingController tanggalPanenController = TextEditingController();
  final TextEditingController tanggalRoastingController = TextEditingController();
  final TextEditingController tanggalExpiredController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  File? _image;

  Future<void> pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  setState(() {
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Tambah Perawatan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              GestureDetector(
                onTap: pickImage,
                child: _image == null
                    ? Container(
                        color: Colors.grey[300],
                        height: 200,
                        child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                      )
                    : Image.file(_image!),
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Kode',
                controller: kodeController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Varietas Kopi',
                controller: varietasController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Metode Pengolahan',
                controller: metodePengolahanController,
              ),
              SizedBox(height: 15),
              CustomDatePickerField(
                labelText: 'Tanggal Panen',
                controller: tanggalPanenController,
              ),
              SizedBox(height: 15),
              CustomDatePickerField(
                labelText: 'Tanggal Roasting',
                controller: tanggalRoastingController,
              ),
              SizedBox(height: 15),
              CustomDatePickerField(
                labelText: 'Tanggal Expired',
                controller: tanggalExpiredController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Berat',
                controller: beratController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Deskripsi',
                controller: deskripsiController,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  // Lakukan aksi saat tombol ditekan
                  if (_validateInputs()) {
                    _saveData();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Semua input harus diisi.'),
                      ),
                    );
                  }
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateInputs() {
    return kodeController.text.isNotEmpty &&
        varietasController.text.isNotEmpty &&
        metodePengolahanController.text.isNotEmpty &&
        beratController.text.isNotEmpty &&
        tanggalPanenController.text.isNotEmpty &&
        tanggalRoastingController.text.isNotEmpty &&
        deskripsiController.text.isNotEmpty &&
        tanggalExpiredController.text.isNotEmpty;
  }

  void _saveData() {
    // Implementasi penyimpanan data
    // Anda dapat mengakses nilai dari controller menggunakan:
    // kodeController.text, varietasController.text, dll.
  }
}
