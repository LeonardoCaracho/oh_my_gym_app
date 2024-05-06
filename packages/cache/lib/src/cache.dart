abstract class Cache {
  Map<String, dynamic>? read({required String key});

  Future<void> write({
    required String key,
    required Map<String, dynamic> value,
  });

  Future<void> writeString({
    required String key,
    required String value,
  });

  String? readString({
    required String key,
  });
}
