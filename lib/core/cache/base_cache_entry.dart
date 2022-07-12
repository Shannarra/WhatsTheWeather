class BaseCacheEntry<T> {
  final DateTime time;
  final T data;

  const BaseCacheEntry({
    required this.time,
    required this.data,
  });

  factory BaseCacheEntry.create(T data) =>
      BaseCacheEntry<T>(time: DateTime.now(), data: data);
}
