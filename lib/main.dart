// import 'package:app_rental/dto/payment.dart';
import 'package:app_rental/components/auth_wrapper.dart';
import 'package:app_rental/cubit/cart/cart_cubit.dart';
// import 'package:app_rental/cubit/order/order_cubit.dart';
// import 'package:app_rental/cubit/payment/payment_cubit.dart';
import 'package:app_rental/cubit/product/product_cubit.dart';
import 'package:app_rental/screens/routes/BoardingScreen/boarding_screen.dart';
import 'package:app_rental/screens/routes/CartScreen/cart_screen.dart';
import 'package:app_rental/screens/routes/CheckoutScreen/checkout_screen.dart';
import 'package:app_rental/screens/routes/DetailScreen/detail_screen.dart';
import 'package:app_rental/screens/routes/HomeScreen/home_screen.dart';
import 'package:app_rental/screens/routes/ListProductScreen/list_product_screen.dart';
import 'package:app_rental/screens/routes/LoginScreen/login_screen.dart';
import 'package:app_rental/screens/routes/ProfileScreen/profile_screen.dart';
import 'package:app_rental/screens/routes/SpendingScreen/spending_screen.dart';
import 'package:app_rental/utils/token_expired_checking_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:my_app/components/auth_wrapper.dart';
import 'package:app_rental/cubit/auth/auth_cubit.dart';
// import 'package:app_rental/services/data_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final tokenValid = await isTokenValid();
  runApp(MyApp(initialRoute: tokenValid ? '/home-screen' : '/boarding-screen'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<ProductCubit>(create: (context) => ProductCubit()),
        BlocProvider<CartCubit>(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: initialRoute,
        routes: {
          // '/': (context) => const MyHomePage(title: 'Home Screen'),
          '/login-screen': (context) => const LoginScreen(),
          '/profile-screen': (context) => const ProfileScreen(),
          '/detail-screen':
              (context) => AuthWrapper(child: const DetailScreen()),
          '/checkout-screen': (context) => const CheckoutScreen(),
          '/cart-screen': (context) => AuthWrapper(child: const CartScreen()),
          '/home-screen': (context) => AuthWrapper(child: const HomeScreen()),
          '/boarding-screen': (context) => const BoardingScreen(),
          '/spending-screen': (context) => const SpendingScreen(),
          '/product-screen': (context) => const ProductListPage(),
          // '/balance-screen': (context) =>
          //     const AuthWrapper(child: BalanceScreen()),
        },
      ),
    );
  }
}

