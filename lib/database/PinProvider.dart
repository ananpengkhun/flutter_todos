import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';

import './../map/model/PinMarker.dart';

class PinProvider {
  PinProvider._();

  static final db = PinProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    Directory direct = await getApplicationDocumentsDirectory();
    String path = join(direct.path, "Testdb.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, latitude DOUBLE, longtitude DOUBLE)');
    });
  }

  insertPin(double lat, double long) async {
    final db = await database;
    var raw = await db
        .rawInsert('INSERT INTO Test(latitude, longtitude) VALUES($lat,$long)');
    return raw;
  }

  Future<List<PinMarker>> queryPin() async {
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM Test');
    return res != null ? res.map((f) => PinMarker.fromMap(f)).toList() : null;
  }
}
