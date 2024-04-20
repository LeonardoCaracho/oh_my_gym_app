import 'package:local_db/src/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDatabase {
  Future<void> saveUser(UserModel user);
}

class LocalDatabaseImpl implements LocalDatabase {
  LocalDatabaseImpl({required this.database});
  final Database database;

  @override
  Future<void> saveUser(UserModel user) async {
    await database.insert('users', user.toMap());
  }
}
