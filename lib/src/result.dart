class Result<T> {
  final T? data;
  final String? errorMessage;
  final Map<String, String>? params;
  final Exception? exception;

  Result({required this.data, this.errorMessage, this.params, this.exception});

  bool get isError => errorMessage != null || exception != null;

  factory Result.success(T data) {
    return Result(data: data);
  }

  factory Result.failure(String errorMessage, [Map<String, String>? params, Exception? exception]) {
    return Result(data: null, errorMessage: errorMessage, params: params, exception: exception);
  }
}
