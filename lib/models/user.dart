class User {
  final String user;
  final String nama;
  final String email;
  final String pass;
  final String nohp;
  final String lokasi;

  User({
    required this.user,
    required this.nama,
    required this.email,
    required this.pass,
    required this.nohp,
    required this.lokasi,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user: json['user'],
      nama: json['nama'],
      email: json['email'],
      pass : json['pass'],
      nohp: json['nohp'],
      lokasi: json['lokasi'],
    );
  }
}
