import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PanenApi {
  Future<String> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('userNickName') ?? 'User';
    return userName;
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final userName = await _loadUserName();
      final response = await http.get(
        //https://dev.sipkopi.com/api/kopi/tampil/user/(username)
        Uri.parse('https://dev.sipkopi.com/api/kopi/tampil/user/$userName'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse is List && jsonResponse.isNotEmpty && jsonResponse[0] is List) {
          return List<Map<String, dynamic>>.from(jsonResponse[0]);
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
