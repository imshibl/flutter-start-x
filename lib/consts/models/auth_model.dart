String authModel = '''
class AuthModel {
  final String email;
  final String token;

  AuthModel({required this.email, required this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'token': token,
    };
  }
}
''';
