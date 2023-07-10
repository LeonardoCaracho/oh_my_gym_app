abstract class CacheContract {
  T? read<T extends Object>({required String key});
  void write<T extends Object>({required String key, required T value});
}
