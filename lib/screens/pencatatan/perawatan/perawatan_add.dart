import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup/widgets/custom_textfield.dart';
import 'package:login_signup/widgets/custom_datepicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerawatanAdd extends StatefulWidget {
  @override
  _PerawatanAddState createState() => _PerawatanAddState();
}

class _PerawatanAddState extends State<PerawatanAdd> {
  final TextEditingController luasLahanController = TextEditingController();
  final TextEditingController namaPupukController = TextEditingController();
  final TextEditingController jumlahTanamController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController kebutuhanPupukController = TextEditingController();

  String? selectedKodeLahan;
  List<String> kodeLahanList = [];

  String? selectedPerlakuan;
  List<String> perlakuanList = ['Pemupukan', 'Penyiraman'];

  @override
  void initState() {
    super.initState();
    _fetchKodeLahan();
  }

 Future<void> _fetchKodeLahan() async {
    try {
      final userName = await _loadUserName();
      print('User Name from SharedPreferences: $userName');
      if (userName == null) {
        throw Exception('User Name is null');
      }
      final response = await http.get(
        Uri.parse('https://dev.sipkopi.com/api/lahan/tampil/user/$userName'),
      );

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        List<dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse is List && jsonResponse.isNotEmpty && jsonResponse[0] is List) {
          List<dynamic> innerList = jsonResponse[0];

          if (innerList.isNotEmpty && innerList[0] is Map<String, dynamic>) {
            setState(() {
              kodeLahanList = innerList.map((item) => item['kode_lahan'] as String).toList();
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
      print('User Name from SharedPreferences: $userName');
      return userName;
    } catch (e) {
      print('Error loading username: $e');
      return null;
    }
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
              DropdownButtonFormField<String>(
                value: selectedKodeLahan,
                onChanged: (newValue) {
                  setState(() {
                    selectedKodeLahan = newValue;
                  });
                },
                items: kodeLahanList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Kode Lahan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: selectedPerlakuan,
                onChanged: (newValue) {
                  setState(() {
                    selectedPerlakuan = newValue;
                  });
                },
                items: perlakuanList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Perlakuan',
                  border: OutlineInputBorder(),
                ),
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
                isTextInput: false,
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Nama Pupuk',
                      controller: namaPupukController,
                      readOnly: selectedPerlakuan == 'Penyiraman',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Kebutuhan Pupuk',
                      controller: kebutuhanPupukController,
                      isTextInput: false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
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
    return selectedKodeLahan != null &&
        selectedPerlakuan != null &&
        tanggalController.text.isNotEmpty &&
        jumlahTanamController.text.isNotEmpty &&
        (selectedPerlakuan == 'Pemupukan' ? namaPupukController.text.isNotEmpty : true) &&
        kebutuhanPupukController.text.isNotEmpty;
  }

  Future<void> _saveData() async {
    final String apiUrl = 'https://dev.sipkopi.com/api/pere/tambah';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'kode_lahan': selectedKodeLahan,
          'perlakuan': selectedPerlakuan,
          'tanggal': tanggalController.text,
          'kebutuhan': kebutuhanPupukController.text,
          'pupuk': selectedPerlakuan == 'Pemupukan' ? namaPupukController.text : null,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data berhasil disimpan.'),
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menyimpan data. Status: ${response.statusCode}'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }
}
