class ResponseModel {
  final bool success;
  final Object? body;
  final dynamic error;

  const ResponseModel({
    required this.success,
    this.body,
    this.error,
  });
}
