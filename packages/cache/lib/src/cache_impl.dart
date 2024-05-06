import 'package:cache/cache.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheImpl implements Cache {
  CacheImpl({
    required this.userBox,
    required this.box,
  });

  Box<Map<dynamic, dynamic>> userBox;
  Box<String> box;

  @override
  Map<String, dynamic>? read({required String key}) {
    final user = userBox.get(key);

    if (user != null) {
      return Map<String, dynamic>.from(user);
    }

    return null;
  }

  @override
  Future<void> write({
    required String key,
    required Map<String, dynamic> value,
  }) async {
    await userBox.put(key, value);
  }

  @override
  String? readString({required String key}) {
    return box.get(key);
  }

  @override
  Future<void> writeString({required String key, required String value}) async {
    await box.put(key, value);
  }
}
