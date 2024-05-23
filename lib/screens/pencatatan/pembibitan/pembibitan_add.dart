 import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_signup/widgets/custom_textfield.dart';
import 'package:login_signup/widgets/custom_datepicker.dart';

class PembibitanAdd extends StatefulWidget {
  @override
  _PembibitanAddState createState() => _PembibitanAddState();
}

class _PembibitanAddState extends State<PembibitanAdd> {
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController pemilikController = TextEditingController();
  final TextEditingController varietasController = TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();
  final TextEditingController jumlahBibitController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController luasLahanController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('userNickName') ?? 'User';
    setState(() {
      pemilikController.text = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Tambah Pembibitan",
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
                labelText: 'Lokasi Lahan',
                controller: lokasiController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Pemilik Lahan',
                controller: pemilikController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Jenis Varietas',
                controller: varietasController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Ketinggian Tanam',
                controller: ketinggianController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Jumlah Bibit',
                controller: jumlahBibitController,
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomDatePickerField(
                      labelText: 'Tanggal',
                      controller: tanggalController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Luas Lahan',
                      controller: luasLahanController,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Longitude',
                      controller: longitudeController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Latitude',
                      controller: latitudeController,
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
    return lokasiController.text.isNotEmpty &&
        pemilikController.text.isNotEmpty &&
        varietasController.text.isNotEmpty &&
        ketinggianController.text.isNotEmpty &&
        jumlahBibitController.text.isNotEmpty &&
        tanggalController.text.isNotEmpty &&
        luasLahanController.text.isNotEmpty &&
        longitudeController.text.isNotEmpty &&
        latitudeController.text.isNotEmpty;
  }

  void _saveData() {
    // Implementasi penyimpanan data
  }
}