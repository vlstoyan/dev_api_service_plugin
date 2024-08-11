import 'package:dev_api_service_plugin/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.success,
      required super.message,
      super.authToken,
      super.refreshToken});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'authToken': authToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      success: map['success'] as bool,
      message: map['message'] as String,
      authToken: map['authToken'] as String?,
      refreshToken: map['refreshToken'] as String?,
    );
  }
}
