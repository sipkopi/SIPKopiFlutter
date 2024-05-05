import 'dart:convert'; 
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()

// //untuk mengonversi string JSON menjadi objek Users
// Users usersFromMap(String str) => Users.fromMap(json.decode(str));

// // untuk mengonversi objek Users menjadi string JSON
// String usersToMap(Users data) => json.encode(data.toMap());

// Kelas yang merepresentasikan pengguna
class Users {
  final int? usrId; // ID pengguna yang unik, bisa bernilai null
  final String? fullName; 
  final String? email; 
  final String usrName; // Nama pengguna, tidak boleh null
  final String password; 

  // Konstruktor untuk kelas Users
  Users({
    this.usrId,
    this.fullName,
    this.email,
    required this.usrName, // Nama pengguna wajib diisi
    required this.password, // Kata sandi wajib diisi
  });

  // // Metode factory untuk membuat objek Users dari map
  // factory Users.fromMap(Map<String, dynamic> json) => Users(
  //   usrId: json["usrId"], 
  //   fullName: json["fullName"], 
  //   email: json["email"], 
  //   usrName: json["usrName"], 
  //   password: json["usrPassword"], 
  // );

  // // Metode untuk mengonversi objek Users menjadi map
  // Map<String, dynamic> toMap() => {
  //   "usrId": usrId, // Mengonversi usrId menjadi map
  //   "fullName": fullName, 
  //   "email": email, 
  //   "usrName": usrName, 
  //   "usrPassword": password, 
    factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UsersToJson(this);
  }

