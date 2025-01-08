import 'dart:convert';

import 'package:app_rental/services/data_service.dart';
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
  // void createOrder(
  //   int productId,
  //   int orderQuantity,
  //   DateTime startDate,
  //   DateTime endDate,
  //   int userId,
  // ) async {
  //   try {
  //     emit(OrderLoading());

  //     final response = await DataService.createOrder(
  //       userId: userId,
  //       productId: productId,
  //       orderQuantity: orderQuantity,
  //       startDate: startDate,
  //       endDate: endDate,
  //     );

  //     if (response.statusCode == 200) {
  //       // Parse response jika perlu
  //       final orderData = jsonDecode(response.body);
  //       final order = Order.fromJson(
  //         orderData,
  //       ); // Pastikan menggunakan DTO Order yang tepat

  //       emit(
  //         OrderCreated(order),
  //       ); // Emit state success dengan order yang berhasil dibuat
  //     } else {
  //       emit(
  //         OrderError(message: 'Failed to create order: ${response.statusCode}'),
  //       );
  //     }
  //   } catch (e) {
  //     emit(
  //       OrderError(message: "${e.toString()}"),
  //     ); // Emit error jika ada masalah
  //   }
  // }

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
