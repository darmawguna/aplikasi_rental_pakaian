class Login {
  final String accessToken;
  final String tokenType;

  Login({
    required this.accessToken,
    required this.tokenType,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
    );
  }
}
