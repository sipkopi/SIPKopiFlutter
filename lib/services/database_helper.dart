import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/notifikasi.dart';

class DatabaseHelper {
  final databaseName = "auth.db";

  String notifikasiTable = ''' 
   CREATE TABLE notifikasi (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   judul TEXT,
   deskripsi TEXT,
   tanggal TEXT,
   jam TEXT,
   isCompleted INTEGER DEFAULT 0
   )
   ''';

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(
      path,
      version: 2, // Increment the version number
      onCreate: (db, version) async {
        await db.execute(notifikasiTable);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE notifikasi ADD COLUMN isCompleted INTEGER DEFAULT 0');
        }
      },
    );
  }

  Future<int> createNotifikasi(Notifikasi notifikasi) async {
    final Database db = await initDB();
    return db.insert("notifikasi", notifikasi.toMap()..remove('id')); // Remove 'id' before insert
  }

  Future<List<Notifikasi>> getNotifikasi() async {
    final Database db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query("notifikasi");

    return List.generate(maps.length, (i) {
      return Notifikasi.fromMap(maps[i]);
    });
  }

  Future<void> updateNotifikasi(Notifikasi notifikasi) async {
    final db = await initDB();
    await db.update(
      'notifikasi',
      notifikasi.toMap(),
      where: 'id = ?',
      whereArgs: [notifikasi.id],
    );
  }
}
