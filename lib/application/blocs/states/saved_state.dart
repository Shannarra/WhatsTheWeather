class SavedState<T> {
  final List<T> data;

  SavedState(this.data);

  factory SavedState.empty() => SavedState<T>(List<T>.empty());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedState &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}
