abstract class UserCacheContract {
  Map<String, dynamic>? read({required String key});

  Future<void> write({
    required String key,
    required Map<String, dynamic> value,
  });
}
