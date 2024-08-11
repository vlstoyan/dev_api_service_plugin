import 'package:dev_api_service_plugin/entities/response.dart';

class ResponseModel extends Response {
  ResponseModel({
    required super.success,
    required super.message,
    super.page,
    super.perPage,
    super.totalItems,
    super.totalPages,
    super.data,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'page': page,
      'perPage': perPage,
      'totalItems': totalItems,
      'totalPages': totalPages,
      'data': data,
    };
  }

  factory ResponseModel.fromJson(Map<String, dynamic> map) {
    return ResponseModel(
      success: map['success'] as bool,
      message: map['message'] as String,
      page: map['page'] as int?,
      perPage: map['perPage'] as int?,
      totalItems: map['totalItems'] as int?,
      totalPages: map['totalPages'] as int?,
      data: map['data'] as dynamic,
    );
  }
}
