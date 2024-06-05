import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup/screens/product/product.dart';
import 'package:login_signup/widgets/custom_textfield.dart';
import 'package:login_signup/widgets/custom_datepicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:login_signup/services/api_service.dart';
import 'package:login_signup/screens/pencatatan/panen/panen.dart';

class PanenAdd extends StatefulWidget {
  @override
  _PanenAddState createState() => _PanenAddState();
}

class _PanenAddState extends State<PanenAdd> {
  final TextEditingController varietasController = TextEditingController();
  final TextEditingController metodePengolahanController = TextEditingController();
  final TextEditingController beratController = TextEditingController();
  final TextEditingController tanggalPanenController = TextEditingController();
  final TextEditingController tanggalRoastingController = TextEditingController();
  final TextEditingController tanggalExpiredController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  File? _image;

  String? selectedKodePerawatan;
  List<String> kodePerawatanList = [];

  @override
  void initState() {
    super.initState();
    _fetchKodePerawatan();
  }

  Future<void> _fetchKodePerawatan() async {
    try {
      final userName = await _loadUserName();
      if (userName == null) {
        throw Exception('User Name is null');
      }
      final response = await http.get(
        Uri.parse('https://dev.sipkopi.com/api/pere/tampil/user/$userName'),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse is List && jsonResponse.isNotEmpty && jsonResponse[0] is List) {
          List<dynamic> innerList = jsonResponse[0];
          if (innerList.isNotEmpty && innerList[0] is Map<String, dynamic>) {
            setState(() {
              kodePerawatanList = innerList.map((item) => item['kode_peremajaan'] as String).toList();
            });
          } else {
            print('Unexpected inner list format');
          }
        } else {
          print('Unexpected response format');
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<String?> _loadUserName() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userName = prefs.getString('userNickName');
      return userName;
    } catch (e) {
      print('Error loading username: $e');
      return null;
    }
  }

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
          "Tambah Hasil Panen",
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
              DropdownButtonFormField<String>(
                value: selectedKodePerawatan,
                onChanged: (newValue) {
                  setState(() {
                    selectedKodePerawatan = newValue;
                  });
                },
                items: kodePerawatanList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Kode Perawatan',
                  border: OutlineInputBorder(),
                ),
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
                isTextInput: false,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Stok',
                controller: stokController,
                isTextInput: false,
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
    return selectedKodePerawatan != null &&
        varietasController.text.isNotEmpty &&
        metodePengolahanController.text.isNotEmpty &&
        beratController.text.isNotEmpty &&
        tanggalPanenController.text.isNotEmpty &&
        tanggalRoastingController.text.isNotEmpty &&
        deskripsiController.text.isNotEmpty &&
        tanggalExpiredController.text.isNotEmpty &&
        stokController.text.isNotEmpty &&
        _image != null;
  }

  void _saveData() async {
    // Panggil method ApiService untuk menyimpan data
    var result = await ApiService.tambahKopi(
      kode: selectedKodePerawatan!, // Gunakan selectedKodePerawatan
      varietas: varietasController.text,
      metodePengolahan: metodePengolahanController.text,
      tglPanen: tanggalPanenController.text,
      tglRoasting: tanggalRoastingController.text,
      tglExp: tanggalExpiredController.text,
      berat: beratController.text,
      stok: stokController.text,
      deskripsi: deskripsiController.text,
      gambar1: _image!,
    );

    if (result['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
        ),
      );
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductPage()), 
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
        ),
      );
    }
  }
}
