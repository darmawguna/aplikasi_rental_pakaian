import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:app_rental/dto/order.dart';
import 'package:app_rental/dto/payment.dart';
import 'package:app_rental/cubit/product/product_cubit.dart';
import 'package:app_rental/cubit/payment/payment_cubit.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final ProductCubit productCubit;
  final PaymentCubit paymentCubit;

  OrderCubit({required this.productCubit, required this.paymentCubit})
    : super(OrderInitial());

  // Fungsi untuk membuat order baru
  void createOrder(int productId, int orderQuantity, double amount) {
    // Buat order baru
    final newOrder = Order(
      id: 0, // ID baru akan ditentukan oleh server setelah dikirimkan
      userId: 1, // ID user, misalnya
      productId: productId,
      orderQuantity: orderQuantity,
      amount: amount,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 3)), // Misalnya 3 hari
      status: 'pending',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    emit(OrderLoading());

    // Simulasi pengiriman order ke server dan mendapatkan respons
    Future.delayed(Duration(seconds: 2), () {
      // Setelah order berhasil dibuat, simpan order dan emit state
      emit(OrderCreated(newOrder));
    });
  }

  // Fungsi untuk memperbarui status order setelah pembayaran
  void confirmOrderPayment(Order order, Payment payment) {
    if (payment.status == 'paid') {
      final updatedOrder = order.copyWith(status: 'completed');
      emit(OrderConfirmed(updatedOrder));

      // Setelah status order dikonfirmasi, update stok produk terkait
      productCubit.updateStock(order.productId, order.orderQuantity);
    } else {
      emit(OrderError(message: 'Payment failed.'));
    }
  }
}

