import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:app_rental/cubit/order/order_cubit.dart';
import 'package:app_rental/dto/payment.dart';
import 'package:app_rental/dto/order.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final OrderCubit orderCubit;

  PaymentCubit({required this.orderCubit}) : super(PaymentInitial());

  // Fungsi untuk memproses pembayaran
  void processPayment(Order order, Payment payment) {
    if (payment.status == 'paid') {
      // Update status pembayaran menjadi 'paid'
      emit(PaymentSuccess(payment));

      // Setelah pembayaran berhasil, konfirmasi order dan ubah statusnya
      orderCubit.confirmOrderPayment(order, payment);
    } else {
      emit(PaymentError(message: 'Payment failed.'));
    }
  }
}


