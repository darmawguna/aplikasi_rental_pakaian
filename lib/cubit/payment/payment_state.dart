part of 'payment_cubit.dart';

@immutable
class PaymentState {
  final Payment? payment;
  final String? errorMessage;

  const PaymentState({this.payment, this.errorMessage});
}

final class PaymentInitial extends PaymentState {}

final class PaymentSuccess extends PaymentState {
  const PaymentSuccess(Payment payment) : super(payment: payment);
}

final class PaymentError extends PaymentState {
  final String message;
  const PaymentError({required this.message});
}
