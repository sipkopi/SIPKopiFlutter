import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup/screens/pencatatan/perawatan/perawatan_add.dart';

class PerawatanPage extends StatefulWidget {
  @override
  _PerawatanPageState createState() => _PerawatanPageState();
}

class _PerawatanPageState extends State<PerawatanPage> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final response = await http.get(
        Uri.parse('https://dev.sipkopi.com/api/pere/tampil'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');

        if (jsonResponse.containsKey('Data Lahan')) {
          setState(() {
            data = List<Map<String, dynamic>>.from(jsonResponse['Data Lahan']);
          });
        } else {
          print('Data perawatan tidak ditemukan dalam respons');
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Perawatan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: data.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                final kodeLahan = item['kode_lahan'] ?? 'Tidak ada data';
                final perlakuan = item['perlakuan'] ?? 'Tidak ada data';
                final tanggal = item['tanggal'] ?? 'Tidak ada data';
                final kebutuhan = item['kebutuhan'].toString() ?? 'Tidak ada data';
                final pupuk = item['pupuk'] ?? 'Tidak ada data';

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4.0,
                    child: ListTile(
                      leading: Icon(
                        Icons.local_florist, // Icon untuk kode lahan
                        color: Colors.green, // Warna ikon
                      ),
                      title: Text(
                        'Kode Lahan: $kodeLahan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto', // Gunakan font Roboto
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.coffee,
                                color: Colors.green, // Warna ikon
                                size: 16.0, // Ukuran ikon
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Perlakuan: $perlakuan',
                                style: TextStyle(
                                  fontFamily: 'Roboto', // Gunakan font Roboto
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.green, // Warna ikon
                                size: 16.0, // Ukuran ikon
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Tanggal: $tanggal',
                                style: TextStyle(
                                  fontFamily: 'Roboto', // Gunakan font Roboto
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.local_activity,
                                color: Colors.green, // Warna ikon
                                size: 16.0, // Ukuran ikon
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Kebutuhan: $kebutuhan',
                                style: TextStyle(
                                  fontFamily: 'Roboto', // Gunakan font Roboto
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.eco,
                                color: Colors.green, // Warna ikon
                                size: 16.0, // Ukuran ikon
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Pupuk: $pupuk',
                                style: TextStyle(
                                  fontFamily: 'Roboto', // Gunakan font Roboto
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        // Tambahkan logika navigasi jika diperlukan
                      },
                    ),
                  ),
                );
              },
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
