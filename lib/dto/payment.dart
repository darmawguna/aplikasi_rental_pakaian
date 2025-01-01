class Payment {
  int id;
  int orderId;
  double amount;
  String paymentMethod;
  String status;
  DateTime createdAt;

  Payment({
    required this.id,
    required this.orderId,
    required this.amount,
    required this.paymentMethod,
    required this.status,
    required this.createdAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] as int,
      orderId: json['order_id'] as int,
      amount: double.parse(json['amount']), // Parsing string ke double
      paymentMethod: json['payment_method'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
