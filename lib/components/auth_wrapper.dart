import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/cubit/auth/auth_cubit.dart';
import 'package:app_rental/screens/routes/LoginScreen/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;
  const AuthWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        // Periksa apakah token ada dan valid
        if (state.isLoggedIn && !state.isTokenExpired) {
          return child; // Tampilkan halaman child jika login dan token valid
        } else {
          // Jika tidak ada token atau token kedaluwarsa, arahkan ke halaman login
          // Menggunakan `Navigator.pushReplacementNamed` untuk mencegah pengembalian ke halaman sebelumnya
          Future.microtask(() {
            Navigator.pushReplacementNamed(context, "/login-screen");
          });
          return const SizedBox.shrink(); // Sembunyikan widget jika sedang mengalihkan ke halaman login
        }
      },
    );
  }
}
