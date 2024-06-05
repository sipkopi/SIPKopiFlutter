import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/pencatatan/panen/panen_add.dart';
import 'package:login_signup/services/panen_api.dart'; 

class PanenPage extends StatefulWidget {
  @override
  _PanenPageState createState() => _PanenPageState();
}

class _PanenPageState extends State<PanenPage> {
  List<Map<String, dynamic>> data = [];
  bool isLoading = true;
  String errorMessage = '';
  final PanenApi panenApi = PanenApi();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final fetchedData = await panenApi.fetchData();
      setState(() {
        data = fetchedData;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
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
          "Data Panen",
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
                        'Tidak Ada Data',
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
                                Icons.local_florist, 
                                color: Colors.green, 
                              ),
                              title: Text(
                                'Kode Kopi: $kodeKopi',
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
                                        'Varietas Kopi: $varietasKopi',
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
                                        Icons.settings, 
                                        color: Colors.green, 
                                        size: 16.0, 
                                      ),
                                      SizedBox(width: 8.0),
                                      Text(
                                        'Metode Pengolahan: $metodePengolahan',
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
                                        'Tanggal Roasting: $tglRoasting',
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
                                        Icons.inventory, 
                                        color: Colors.green, 
                                        size: 16.0, 
                                      ),
                                      SizedBox(width: 8.0),
                                      Text(
                                        'Stok: $stok',
                                        style: TextStyle(
                                          fontFamily: 'Roboto', 
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              onTap: () {
                               
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
