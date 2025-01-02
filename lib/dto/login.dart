class Login {
  final String accessToken;
  final String tokenType;
  final DateTime expiredAt;

  Login({
    required this.accessToken,
    required this.tokenType,
    required this.expiredAt,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      expiredAt: DateTime.parse(json['expired_at'] as String),
    );
  }
}
