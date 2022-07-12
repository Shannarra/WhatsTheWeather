import 'package:flutter_course_2022/core/cache/base_cache_entry.dart';

class BaseCache<K, Q> {
  final Duration expirationTime;
  final Map<K, BaseCacheEntry<Q>> _memoryCache = <K, BaseCacheEntry<Q>>{};

  BaseCache({
    required this.expirationTime,
  });

  void put(K key, Q value) =>
      _memoryCache[key] = BaseCacheEntry<Q>.create(value);

  Q? get(K key) {
    final BaseCacheEntry<Q>? entry = _memoryCache[key];

    if (entry == null) return null;

    final DateTime time = DateTime.now();

    if (time.difference(entry.time) > expirationTime) return null;

    return entry.data;
  }
}
