typedef DataMapper<Q, T> = Q Function(T data);

abstract class Result<T> {
  factory Result.loading() {
    return ResultLoading<T>._();
  }

  factory Result.success(T data) {
    return ResultSuccess<T>._(data);
  }

  factory Result.error(Object error) {
    return ResultError<T>._(error);
  }
}

class ResultLoading<T> implements Result<T> {
  ResultLoading._();
}

class ResultSuccess<T> implements Result<T> {
  ResultSuccess._(this.data);

  final T data;
}

class ResultError<T> implements Result<T> {
  ResultError._(this.exception);

  final Object exception;
}

extension ResultExtenstion<T> on Result<T> {
  bool get isSuccess => this is ResultSuccess<T>;

  bool get isFail => this is ResultError<T>;

  bool get isLoading => this is ResultLoading<T>;

  ResultLoading<T> toLoading() => this as ResultLoading<T>;

  ResultSuccess<T> toSuccess() => this as ResultSuccess<T>;

  ResultError<T> toError() => this as ResultError<T>;

  Result<Q> map<Q>(DataMapper<Q, T> mapper) {
    if (isSuccess) {
      final Q newData = mapper(toSuccess().data);
      return Result<Q>.success(newData);
    }

    if (isLoading) {
      return Result<Q>.loading();
    }

    return Result<Q>.error(toError().exception);
  }
}
