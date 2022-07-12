typedef ValueCheck<T> = bool Function(T e);

extension ListExtensions<T> on List<T> {
  T? firstWhereOrNull(ValueCheck<T> valueCheck) {
    try {
      return firstWhere(valueCheck);
    } catch (e) {
      return null;
    }
  }
}
