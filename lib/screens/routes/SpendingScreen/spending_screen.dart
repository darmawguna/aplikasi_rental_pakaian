import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/cubit/auth/auth_cubit.dart';
import 'package:app_rental/dto/payment.dart';
import 'package:app_rental/services/data_service.dart';
import 'package:app_rental/utils/constants.dart';

class SpendingScreen extends StatefulWidget {
  const SpendingScreen({super.key});

  @override
  State<SpendingScreen> createState() => _SpendingScreenState();
}

class _SpendingScreenState extends State<SpendingScreen> {
  Future<List<Payment>>? _payments;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        final token = authState.accessToken;

        if (token != null && token.isNotEmpty) {
          if (_payments == null) {
            // Memanggil API untuk mengambil data pembayaran
            _payments = DataService.fetchPayments(token);
          }
        } else {
          // Tampilkan pesan jika token tidak tersedia
          return const Center(
            child: Text("Token tidak tersedia, silakan login."),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Spendings')),
          body: FutureBuilder<List<Payment>>(
            future: _payments,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final dataList = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      final item = dataList[index];
                      return MyListItemWidget(item: item);
                    },
                  ),
                );
              } else {
                return const Center(child: Text("No data available"));
              }
            },
          ),
        );
      },
    );
  }
}

class MyListItemWidget extends StatelessWidget {
  final Payment item;

  const MyListItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${item.amount}'),
      subtitle: Text(formatDate.format(item.createdAt)),
      leading: const Icon(Icons.monetization_on),
    );
  }
}
