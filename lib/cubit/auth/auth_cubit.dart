import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitialState());

  void login(String accessToken, DateTime expiredAt) {
    print('data dari method login');
    print(accessToken);
    print(expiredAt);
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

  Future<void> checkTokenValidity() async {
    if (state.accessToken != null && !state.isTokenExpired) {
      emit(
        AuthState(
          isLoggedIn: true,
          accessToken: state.accessToken,
          expiredAt: state.expiredAt,
        ),
      );
    } else {
      emit(
        const AuthState(isLoggedIn: false, accessToken: null, expiredAt: null),
      );
    }
  }

  bool isSessionActive() {
    return state.isLoggedIn && !state.isTokenExpired;
  }
}
