abstract class ViewState<T> {
  factory ViewState.notLoaded() => ViewStateNotLoaded<T>();

  factory ViewState.loading() => ViewStateLoading<T>();

  factory ViewState.loaded(T data) => ViewStateLoaded<T>(data);

  factory ViewState.error(Object e) => ViewStateError<T>(e);
}

class ViewStateNotLoaded<T> implements ViewState<T> {}

class ViewStateLoading<T> implements ViewState<T> {}

class ViewStateLoaded<T> implements ViewState<T> {
  final T data;

  ViewStateLoaded(this.data);
}

class ViewStateError<T> implements ViewState<T> {
  final Object e;

  ViewStateError(this.e);
}
