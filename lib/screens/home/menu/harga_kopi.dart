import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/services/harga_kopi_api.dart';
import 'package:login_signup/screens/home/menu/harvest_price.dart';

class HargaKopi extends StatefulWidget {
  @override
  _HargaKopiState createState() => _HargaKopiState();
}

class _HargaKopiState extends State<HargaKopi> {
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
      final fetchedData = await HargaKopiApi.fetchData();
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
        title: Text(
          "Harga Kopi",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 5),
                              Text(
                                'Menunjukkan harga untuk wilayah:',
                                style: GoogleFonts.aBeeZee(fontSize: 9.0),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Kecamatan Sumber Wringin, Kabupaten Bondowoso',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 12.0, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          final namaVarietas = item['nama_varietas'] ?? 'Tidak ada data';
                          final harga = item['harga'] ?? 'Tidak ada data';
                          final satuan = 'Biji Kering/kg';
                          final sumber = item['sumber'] ?? 'Tidak ada data';

                         return Column(
                            children: [
                              HarvestPricePage(
                                komoditas: namaVarietas,
                                hargaSaatIni: harga,
                                satuan: satuan,
                                sumber: sumber,
                              ),
                              if (index < data.length - 1) SizedBox(height: 5), // Persempit jarak antar card
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
    );
  }
}