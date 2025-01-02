part of 'auth_cubit.dart';

@immutable
class AuthState {
  final bool isLoggedIn;
  final String? accessToken;
  final DateTime? expiredAt;

  const AuthState({required this.isLoggedIn, this.accessToken, this.expiredAt});

  bool get isTokenExpired {
    if (expiredAt == null) {
      return true; // Jika `expiredAt` null, anggap token kedaluwarsa
    }
    return DateTime.now().isAfter(expiredAt!);
  }
}

final class AuthInitialState extends AuthState {
  const AuthInitialState()
    : super(isLoggedIn: false, accessToken: null, expiredAt: null);
}
