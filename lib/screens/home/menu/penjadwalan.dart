import 'package:flutter/material.dart';
import 'package:login_signup/widgets/custom_textfield.dart';
import 'package:login_signup/widgets/custom_timepicker.dart';
import 'package:login_signup/widgets/custom_datepicker.dart';
import 'package:login_signup/services/database_helper.dart'; // Import DatabaseHelper
import 'package:login_signup/models/notifikasi.dart'; // Import Notifikasi model

class PenjadwalanPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final DatabaseHelper dbHelper = DatabaseHelper(); // Inisialisasi DatabaseHelper

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Tambah Penjadwalan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
         leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              CustomTextField(
                labelText: 'Judul',
                controller: titleController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Deskripsi',
                controller: subjectController,
              ),
              SizedBox(height: 20),
              CustomDatePickerField(
                labelText: 'Date',
                controller: dateController,
              ),
              SizedBox(height: 15),
              CustomTimePickerField(
                labelText: 'Time',
                controller: timeController,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () async {
                  if (_validateInputs()) {
                    await _saveData();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Data berhasil disimpan.'),
                      ),
                    );
                    Navigator.pop(context);
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
    return titleController.text.isNotEmpty &&
        subjectController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        timeController.text.isNotEmpty;
  }

  Future<void> _saveData() async {
    // Membuat instance Notifikasi
    Notifikasi notifikasi = Notifikasi(
      judul: titleController.text,
      deskripsi: subjectController.text,
      tanggal: dateController.text,
      jam: timeController.text,
    );

    // Menyimpan notifikasi ke database
    await dbHelper.createNotifikasi(notifikasi);
  }
}
