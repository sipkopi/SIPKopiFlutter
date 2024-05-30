import 'dart:convert';
import 'package:http/http.dart' as http;

class HargaKopiApi {
  static Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://dev.sipkopi.com/api/hargakopi/tampil'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['Data Harga Kopi'] is List) {
          return List<Map<String, dynamic>>.from(jsonResponse['Data Harga Kopi']);
        } else {
          throw Exception('Respons JSON tidak sesuai dengan yang diharapkan');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
