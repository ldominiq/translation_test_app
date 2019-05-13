import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:translation_app/ClientModel.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id INTEGER PRIMARY KEY,"
          "source TEXT,"
          "target TEXT,"
          "file TEXT"
          ")");
    });
  }

  getSource(int id) async {
    final db = await database;
    var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Traduction.fromMap(res.first) : null;
  }

  Future<List<Traduction>> getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<Traduction> list =
        res.isNotEmpty ? res.map((c) => Traduction.fromMap(c)).toList() : [];
    return list;
  }
}