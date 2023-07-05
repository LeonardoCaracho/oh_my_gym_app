import 'package:cache/cache.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserCache implements UserCacheContract {
  UserCache({required this.userBox});

  Box<Map<dynamic, dynamic>> userBox;

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
}
