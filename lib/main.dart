// import 'package:app_rental/dto/payment.dart';
import 'package:app_rental/cubit/order/order_cubit.dart';
import 'package:app_rental/cubit/payment/payment_cubit.dart';
import 'package:app_rental/cubit/product/product_cubit.dart';
import 'package:app_rental/screens/routes/BoardingScreen/boarding_screen.dart';
import 'package:app_rental/screens/routes/CheckoutScreen/checkout_screen.dart';
import 'package:app_rental/screens/routes/DetailScreen/detail_screen.dart';
import 'package:app_rental/screens/routes/HomeScreen/home_screen.dart';
import 'package:app_rental/screens/routes/ListProductScreen/list_product_screen.dart';
import 'package:app_rental/screens/routes/LoginScreen/login_screen.dart';
import 'package:app_rental/screens/routes/ProfileScreen/profile_screen.dart';
import 'package:app_rental/screens/routes/SpendingScreen/spending_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:my_app/components/auth_wrapper.dart';
import 'package:app_rental/cubit/auth/auth_cubit.dart';
import 'package:app_rental/services/data_service.dart';
import 'package:app_rental/utils/constants.dart';
import 'package:app_rental/utils/secure_storage_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Mengecek apakah token masih valid menggunakan metode isTokenValid
  final tokenValid = await DataService.isTokenValid();

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
      ],
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: initialRoute,

        // initialRoute: '/boarding-screen',

        // initialRoute: '/',
        routes: {
          // '/': (context) => const MyHomePage(title: 'Home Screen'),
          '/login-screen': (context) => const LoginScreen(),
          '/profile-screen': (context) => const ProfileScreen(),
          '/detail-screen': (context) => const DetailScreen(),
          '/checkout-screen': (context) => const CheckoutScreen(),
          '/home-screen': (context) => const HomeScreen(),
          '/boarding-screen': (context) => const BoardingScreen(),
          '/spending-screen': (context) => const SpendingScreen(),
          '/product-screen': (context) => const ProductListPage(),
          // TODO contoh penggunaan authWrapper
          // '/balance-screen': (context) =>
          //     const AuthWrapper(child: BalanceScreen()),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const BoardingScreen(),
    const DetailScreen(),
  ];

  final List<String> _appBarTitles = const [
    'Home',
    'Boarding',
    'Detail',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateAndCloseDrawer(BuildContext context, String routeName) {
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.pop(context); // Close the drawer first
    }
    Navigator.pushNamed(context, routeName);
  }

  Future<void> doLogout(context) async {
    debugPrint("need logout");
    final response = await DataService.logoutData();
    if (response.statusCode == 200) {
      await SecureStorageUtil.storage.delete(key: tokenStoreName);
      Navigator.pushReplacementNamed(context, "/boarding-screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _selectedIndex == 0 ? null : Text(_appBarTitles[_selectedIndex]),
        backgroundColor:
            _selectedIndex == 0 ? Colors.blue.shade900 : Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            listTilePush(context, 'Home Screen Desri', '/home-screen'),
            listTilePush(context, 'Detail Screen Desri', '/detail-screen'),
            listTilePush(context, 'Boarding Screen', '/boarding-screen'),
            listTilePush(context, 'Balance Screen', '/balance-screen'),
            listTilePush(context, 'Spending Screen', '/spending-screen'),
            listTilePush(context, 'Login Screen', '/login-screen'),
            listTilePush(context, 'Product list Screen', '/product-screen'),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                doLogout(context);
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  ListTile listTilePush(
    BuildContext context,
    String screenName,
    String routesname,
  ) {
    return ListTile(
      title: Text(screenName),
      selected: _selectedIndex == 2,
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, routesname);
      },
    );
  }
}
