import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/services/database_helper.dart';
import 'package:login_signup/models/notifikasi.dart';

class NotifikasiPage extends StatefulWidget {
  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Notifikasi> notifikasiList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNotifikasi();
  }

  Future<void> _loadNotifikasi() async {
    notifikasiList = await dbHelper.getNotifikasi();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _updateNotifikasi(Notifikasi notifikasi) async {
    await dbHelper.updateNotifikasi(notifikasi);
    _loadNotifikasi(); // Reload notifications after update
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Data Notifikasi",
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
          : notifikasiList.isEmpty
              ? Center(
                  child: Text(
                    'Tidak Ada Data Notifikasi',
                    style: GoogleFonts.roboto(fontSize: 20.0),
                  ),
                )
              : ListView.builder(
                  itemCount: notifikasiList.length,
                  itemBuilder: (context, index) {
                    final notifikasi = notifikasiList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4.0,
                        child: ListTile(
                          leading: Icon(Icons.notifications),
                          title: Text(
                            notifikasi.judul,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              decoration: notifikasi.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Deskripsi: ${notifikasi.deskripsi}', style: GoogleFonts.roboto()),
                              Text('Tanggal: ${notifikasi.tanggal}', style: GoogleFonts.roboto()),
                              Text('Jam: ${notifikasi.jam}', style: GoogleFonts.roboto()),
                            ],
                          ),
                          trailing: Checkbox(
                            value: notifikasi.isCompleted,
                            onChanged: (value) {
                              setState(() {
                                notifikasi.isCompleted = value!;
                              });
                              _updateNotifikasi(notifikasi);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
