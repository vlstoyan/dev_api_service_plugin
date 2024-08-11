class User {
  final bool success;
  final String message;
  final String? authToken;
  final String? refreshToken;
  User({
    required this.success,
    required this.message,
    this.authToken,
    this.refreshToken,
  });

  User copyWith({
    bool? success,
    String? message,
    String? authToken,
    String? refreshToken,
  }) {
    return User(
      success: success ?? this.success,
      message: message ?? this.message,
      authToken: authToken ?? this.authToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
