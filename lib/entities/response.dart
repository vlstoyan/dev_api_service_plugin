class Response {
  final bool success;
  final String message;
  final int? page;
  final int? perPage;
  final int? totalItems;
  final int? totalPages;
  final dynamic data;

  Response({
    required this.success,
    required this.message,
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
    this.data,
  });

  Response copyWith({
    bool? success,
    String? message,
    int? page,
    int? perPage,
    int? totalItems,
    int? totalPages,
    dynamic data,
  }) {
    return Response(
      success: success ?? this.success,
      message: message ?? this.message,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      totalItems: totalItems ?? this.totalItems,
      totalPages: totalPages ?? this.totalPages,
      data: data ?? this.data,
    );
  }
}

enum Sort { asc, desc }
