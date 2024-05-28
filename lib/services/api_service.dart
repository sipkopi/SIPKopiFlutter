import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class ApiService { //tambah kopi
  static const String apiUrl = 'https://dev.sipkopi.com/api/kopi/tambah';

  static Future<Map<String, dynamic>> tambahKopi({
    required String kode,
    required String varietas,
    required String metodePengolahan,
    required String tglPanen,
    required String tglRoasting,
    required String tglExp,
    required String berat,
    required String stok,
    required String deskripsi,
    required File gambar1,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.fields['kode_peremajaan'] = kode;
      request.fields['varietas_kopi'] = varietas;
      request.fields['metode_pengolahan'] = metodePengolahan;
      request.fields['tgl_panen'] = tglPanen;
      request.fields['tgl_roasting'] = tglRoasting;
      request.fields['tgl_exp'] = tglExp;
      request.fields['berat'] = berat;
      request.fields['stok'] = stok;
      request.fields['deskripsi'] = deskripsi;

      request.files.add(await http.MultipartFile.fromPath('gambar1', gambar1.path));

      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);

      if (response.statusCode == 201) {
        return {'success': true, 'message': 'Data berhasil disimpan.'};
      } else {
        return {'success': false, 'message': 'Gagal menyimpan data: $responseString'};
      }
    } catch (e) {
      print('Error: $e');
      return {'success': false, 'message': 'Error: $e'};
    }
  }
}
