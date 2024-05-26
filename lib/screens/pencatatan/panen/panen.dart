import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup/screens/pencatatan/panen/panen_add.dart';

class PanenPage extends StatefulWidget {
  @override
  _PanenPageState createState() => _PanenPageState();
}

class _PanenPageState extends State<PanenPage> {
  List<Map<String, dynamic>> data = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

Future<void> loadData() async {
  try {
    final response = await http.get(
      Uri.parse('https://dev.sipkopi.com/api/kopi/tampil'),
    );

    if (response.statusCode == 200) {
      //print('Response: ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic>? dataAkun = jsonResponse['Data Akun'];
      if (dataAkun is List) {
        setState(() {
          data = dataAkun.cast<Map<String, dynamic>>();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Unexpected response format';
          isLoading = false;
        });
        print('Unexpected response format');
      }
    } else {
      setState(() {
        errorMessage = 'Failed to load data: ${response.statusCode}';
        isLoading = false;
      });
      print('Failed to load data: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  } catch (e) {
    setState(() {
      errorMessage = 'Error: $e';
      isLoading = false;
    });
    print('Error: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Data Panen",
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
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )
              : data.isEmpty
                  ? Center(
                      child: Text(
                        'Data Kosong!',
                        style: GoogleFonts.aBeeZee(fontSize: 20.0),
                      ),
                    )
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final item = data[index];
                        final kodeKopi = item['kode_kopi'] ?? 'Tidak ada data';
                        final varietasKopi = item['varietas_kopi'] ?? 'Tidak ada data';
                        final metodePengolahan = item['metode_pengolahan'] ?? 'Tidak ada data';
                        final tglRoasting = item['tgl_roasting'] ?? 'Tidak ada data';
                        final stok = item['stok']?.toString() ?? 'Tidak ada data';

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: Card(
                            elevation: 4.0,
                            child: ListTile(
                              leading: Icon(
                                Icons.local_florist, // Icon untuk varietas kopi
                                color: Colors.green, // Warna ikon
                              ),
                              title: Text(
                                'Kode Kopi: $kodeKopi',
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
                                        'Varietas Kopi: $varietasKopi',
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
                                        Icons.settings, // Icon untuk metode pengolahan
                                        color: Colors.green, // Warna ikon
                                        size: 16.0, // Ukuran ikon
                                      ),
                                      SizedBox(width: 8.0),
                                      Text(
                                        'Metode Pengolahan: $metodePengolahan',
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
                                        Icons.calendar_today, // Icon untuk tanggal roasting
                                        color: Colors.green, // Warna ikon
                                        size: 16.0, // Ukuran ikon
                                      ),
                                      SizedBox(width: 8.0),
                                      Text(
                                        'Tanggal Roasting: $tglRoasting',
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
                                        Icons.inventory, // Icon untuk stok
                                        color: Colors.green, // Warna ikon
                                        size: 16.0, // Ukuran ikon
                                      ),
                                      SizedBox(width: 8.0),
                                      Text(
                                        'Stok: $stok',
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
            MaterialPageRoute(builder: (context) => PanenAdd()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
