import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitialState());

  void login(String accessToken, DateTime expiredAt) {
    emit(
      AuthState(
        isLoggedIn: true,
        accessToken: accessToken,
        expiredAt: expiredAt,
      ),
    );
  }

  void logout() {
    emit(
      const AuthState(isLoggedIn: false, accessToken: null, expiredAt: null),
    );
  }

  bool isSessionActive() {
    return state.isLoggedIn && !state.isTokenExpired;
  }

  

}
