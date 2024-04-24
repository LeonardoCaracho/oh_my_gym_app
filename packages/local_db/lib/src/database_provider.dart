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
      version: 2,
      onCreate: _createDb,
    );
  }

  static Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id TEXT PRIMARY KEY,
        name TEXT,
        email TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS workouts (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        userId INTEGER, 
        name TEXT, 
        FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
      ),
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS exercises (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        workoutId INTEGER, 
        name TEXT,
        observation TEXT, 
        FOREIGN KEY (workoutId) REFERENCES workouts(id) ON DELETE CASCADE
      ),
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS series (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        exerciseId INTEGER, 
        reps INTEGER, 
        weight DOUBLE,
        prevReps INTEGER,
        prevWeight DOUBLE,
        isDone BOOLEAN,
        FOREIGN KEY (exerciseId) REFERENCES exercises(id) ON DELETE CASCADE
      ),
    ''');
  }
}
