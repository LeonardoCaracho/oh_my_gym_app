import 'dart:developer';

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
    final dbPath = await getDatabasesPath();
    log(dbPath);
    String path = join(dbPath, 'database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
      onUpgrade: _updateDB,
    );
  }

  static Future<void> _createDb(Database db, int version) async {
    await db.execute(
        '''
      CREATE TABLE IF NOT EXISTS users (
        id TEXT PRIMARY KEY,
        name TEXT,
        email TEXT
      )
    ''');

    await db.execute(
        '''
      CREATE TABLE IF NOT EXISTS workouts (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        userId TEXT, 
        name TEXT, 
        FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');

    await db.execute(
        '''
      CREATE TABLE IF NOT EXISTS exercises (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        workoutId INTEGER, 
        name TEXT,
        observation TEXT, 
        FOREIGN KEY (workoutId) REFERENCES workouts(id) ON DELETE CASCADE
      )
    ''');

    await db.execute(
        '''
      CREATE TABLE IF NOT EXISTS series (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        exerciseId INTEGER, 
        reps INTEGER, 
        weight DOUBLE,
        prevReps INTEGER,
        prevWeight DOUBLE,
        isDone BOOLEAN,
        FOREIGN KEY (exerciseId) REFERENCES exercises(id) ON DELETE CASCADE
      )
    ''');

    await db.execute(
        '''
      CREATE TABLE IF NOT EXISTS workouts_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        workoutId INTEGER,
        userId TEXT,
        name TEXT,
        finishDate DATETIME,
        FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');

    await db.execute(
        '''
      CREATE TABLE IF NOT EXISTS exercises_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        workoutId INTEGER, 
        name TEXT,
        observation TEXT, 
        FOREIGN KEY (workoutId) REFERENCES workouts_records(id) ON DELETE CASCADE
      )
    ''');

    await db.execute(
        '''
      CREATE TABLE IF NOT EXISTS series_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        exerciseId INTEGER, 
        reps INTEGER, 
        weight DOUBLE,
        prevReps INTEGER,
        prevWeight DOUBLE,
        isDone BOOLEAN,
        FOREIGN KEY (exerciseId) REFERENCES exercises_records(id) ON DELETE CASCADE
      )
    ''');

    await db.execute(
        '''
      CREATE TABLE IF NOT EXISTS exercise_types (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        userId TEXT, 
        musclePrimary TEXT, 
        muscleSecondary TEXT,
        name TEXT,
        type TEXT,
        FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');
  }

  static Future<void> _updateDB(Database db, int newVersion, int oldVersion) async {}
}
