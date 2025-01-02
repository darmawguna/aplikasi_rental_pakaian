part of 'order_cubit.dart';

@immutable
class OrderState {
  final Order? order;
  final String? errorMessage;

  const OrderState({this.order, this.errorMessage});
}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderCreated extends OrderState {
  const OrderCreated(Order order) : super(order: order);
}

final class OrderConfirmed extends OrderState {
  const OrderConfirmed(Order order) : super(order: order);
}

final class OrderError extends OrderState {
  const OrderError({required String message}) : super(errorMessage: message);
}
