import 'package:flutter/material.dart';
import 'package:login_signup/widgets/custom_textfield.dart';
import 'package:login_signup/widgets/custom_datepicker.dart';

class PerawatanAdd extends StatelessWidget {
  final TextEditingController kodeLahanController = TextEditingController();
  final TextEditingController luasLahanController = TextEditingController();
  final TextEditingController perlakuanController = TextEditingController();
  final TextEditingController namaPupukController = TextEditingController();
  final TextEditingController jumlahTanamController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController kebutuhanPupukController = TextEditingController();

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
              SizedBox(height: 40),
              CustomTextField(
                labelText: 'Kode Lahan',
                controller: kodeLahanController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Luas Lahan',
                controller: luasLahanController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Perlakuan',
                controller: perlakuanController,
              ),
              SizedBox(height: 15),
           CustomDatePickerField(
                      labelText: 'Tanggal',
                      controller: tanggalController,
                    ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Jumlah Tanam',
                controller: jumlahTanamController,
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: 
                       CustomTextField(
                labelText: 'Nama Pupuk',
                controller: namaPupukController,
              ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Kebutuhan Pupuk',
                      controller: kebutuhanPupukController,
                    ),
                  ),
                ],
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
    return kodeLahanController.text.isNotEmpty &&
        luasLahanController.text.isNotEmpty &&
        perlakuanController.text.isNotEmpty &&
        namaPupukController.text.isNotEmpty &&
        jumlahTanamController.text.isNotEmpty &&
        tanggalController.text.isNotEmpty &&
        kebutuhanPupukController.text.isNotEmpty;
  }

  void _saveData() {
    // Implementasi penyimpanan data
    // Anda dapat mengakses nilai dari controller menggunakan:
    // kodeLahanController.text, luasLahanController.text, dll.
  }
}
