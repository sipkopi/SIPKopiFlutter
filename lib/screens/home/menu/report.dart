import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<String?> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userNickName'); 
  }

  Future<void> loadData() async {
    try {
      final userName = await _loadUserName();
      print('User Name: $userName');
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

          // Check if the inner list contains maps
          if (innerList.isNotEmpty && innerList[0] is Map<String, dynamic>) {
            setState(() {
              data = innerList.map((item) => item as Map<String, dynamic>).toList();
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

  String _calculateAge(String tanggal) {
    DateTime tanamDate = DateTime.parse(tanggal);
    Duration ageDuration = DateTime.now().difference(tanamDate);
    return ageDuration.inDays.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Data Laporan",
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
                final varietasPohon = item['varietas_pohon'] ?? 'Tidak ada data';
                final totalBibit = item['total_bibit'].toString();
                final tanggal = item['tanggal'] ?? 'Tidak ada data';
                final lokasiLahan = item['lokasi_lahan'] ?? 'Tidak ada data';
                final umurBibit = _calculateAge(tanggal);

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4.0,
                    child: ListTile(
                      leading: Icon(
                        Icons.local_florist, // Icon untuk varietas pohon
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
                                'Total Bibit: $totalBibit',
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
                                Icons.calendar_today, // Icon untuk tanggal
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
                                Icons.location_on, // Icon untuk lokasi lahan
                                color: Colors.green, // Warna ikon
                                size: 16.0, // Ukuran ikon
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Lokasi Lahan: $lokasiLahan',
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
                                Icons.timelapse, // Icon untuk umur bibit
                                color: Colors.green, // Warna ikon
                                size: 16.0, // Ukuran ikon
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Umur Bibit: $umurBibit hari',
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
    );
  }
}
