class Notifikasi {
  int? id;
  String judul;
  String deskripsi;
  String tanggal;
  String jam;
  bool isCompleted;

  Notifikasi({
    this.id,
    required this.judul,
    required this.deskripsi,
    required this.tanggal,
    required this.jam,
    this.isCompleted = false, // Default value for isCompleted
  });

  factory Notifikasi.fromMap(Map<String, dynamic> json) => Notifikasi(
    id: json['id'],
    judul: json['judul'],
    deskripsi: json['deskripsi'],
    tanggal: json['tanggal'],
    jam: json['jam'],
    isCompleted: json['isCompleted'] == 1, // Convert from int to bool
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'judul': judul,
    'deskripsi': deskripsi,
    'tanggal': tanggal,
    'jam': jam,
    'isCompleted': isCompleted ? 1 : 0, // Convert from bool to int
  };
}
