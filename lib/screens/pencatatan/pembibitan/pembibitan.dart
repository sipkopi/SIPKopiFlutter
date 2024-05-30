import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup/screens/pencatatan/pembibitan/pembibitan_add.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PembibitanPage extends StatefulWidget {
  @override
  _PembibitanPageState createState() => _PembibitanPageState();
}

class _PembibitanPageState extends State<PembibitanPage> {
  List<Map<String, dynamic>> data = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<String> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('userNickName') ?? 'User';
    return userName;
  }

  Future<void> loadData() async {
    try {
      final userName = await _loadUserName();
      print('User Name: $userName');
      final response = await http.get(
        Uri.parse('https://dev.sipkopi.com/api/lahan/tampil/user/$userName'),
      );

      if (response.statusCode == 200) {
        //print('Response: ${response.body}');
        List<dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse is List && jsonResponse.isNotEmpty && jsonResponse[0] is List) {
          List<dynamic> innerList = jsonResponse[0];

          if (innerList.isNotEmpty && innerList[0] is Map<String, dynamic>) {
            setState(() {
              data = innerList.map((item) => item as Map<String, dynamic>).toList();
              isLoading = false;
            });
          } else {
            print('Unexpected inner list format');
            setState(() {
              isLoading = false;
            });
          }
        } else {
          print('Unexpected response format');
          setState(() {
            isLoading = false;
          });
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Data Pembibitan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : data.isEmpty
              ? Center(
                  child: Text(
                    'Tidak ada Data',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[600],
                    ),
                  ),
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

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Card(
                        elevation: 4.0,
                        child: ListTile(
                          leading: Icon(
                            Icons.local_florist,
                            color: Colors.green,
                          ),
                          title: Text(
                            'Kode Lahan: $kodeLahan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.coffee,
                                    color: Colors.green,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'Total Bibit: $totalBibit',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.green,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'Tanggal: $tanggal',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Flexible(
                                    child: Text(
                                      'Lokasi Lahan: $lokasiLahan',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.grey[800],
                                      ),
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
            MaterialPageRoute(builder: (context) => PembibitanAdd()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
