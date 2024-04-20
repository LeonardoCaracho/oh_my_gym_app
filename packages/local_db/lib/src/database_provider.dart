import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();

  factory DatabaseProvider() => _instance;

  static Database? _database;

  DatabaseProvider._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  static initDatabase() async {
    String path = join(await getDatabasesPath(), 'database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  static Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Users (
        id TEXT PRIMARY KEY,
        name TEXT,
        email TEXT
      )
    ''');
  }
}
