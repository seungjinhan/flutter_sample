import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import '../models/item_model.dart';
import 'package:news_exam/src/resources/repository.dart';

class NewsDbProvicer implements Source, Cache {
  Database db;

  NewsDbProvicer() {
    init();
  }

  void init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'items5.db');
    db = await openDatabase(path, version: 1, onCreate: (Database newDb, int version) {
      newDb.execute('''
        CREATE TABLE Items ( 
          id INTEGER PRIMARY KEY, 
          type TEXT, 
          by TEXT,
          time INTEGER,
          text TEXT,
          parent INTEGER,
          kids BLOB,
          dead INTEGER,
          deleted INTEGER,
          url TEXT,
          score INTEGER,
          title TEXT,
          descendants INTEGER
          )
      ''');
    });
  }

  // Todo - store and fetch top ids
  @override
  Future<List<int>> fetchTopIds() {
    return null;
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      'Items',
      columns: null,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return ItemModel.fromDB(maps.first);
    }

    return null;
  }

  @override
  Future<int> addItem(ItemModel item) async {
    return await db.insert(
      'Items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }
}

final newsDbProvider = NewsDbProvicer();
