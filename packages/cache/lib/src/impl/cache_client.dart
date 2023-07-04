import 'package:cache/cache.dart';

class CacheClient implements CacheContract {
  CacheClient() : _cache = <String, Object>{};

  final Map<String, Object> _cache;

  @override
  T? read<T extends Object>({required String key}) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }

  @override
  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }
}
