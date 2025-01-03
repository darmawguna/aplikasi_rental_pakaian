import 'package:app_rental/cubit/cart/cart_cubit.dart';
import 'package:app_rental/cubit/cart/cart_state.dart';
import 'package:app_rental/screens/routes/CartScreen/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/screens/routes/CartScreen/widgets/date_selector.dart';

class OrderItem extends StatefulWidget {
  final CartItem cartItem;

  const OrderItem({super.key, required this.cartItem});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  void _handleDateSelection(DateTime startDate, DateTime endDate) {
    setState(() {
      selectedStartDate = startDate;
      selectedEndDate = endDate;
    });

    // Update logic with selected dates
    print('Start Date: $startDate');
    print('End Date: $endDate');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                top: -20,
                right: -5,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: () {
                    // Memanggil Cubit untuk menghapus item
                    context.read<CartCubit>().removeFromCart(widget.cartItem);
                  },
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      widget.cartItem.imageUrl,
                      width: 137,
                      height: 141,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cartItem.productName,
                          style: const TextStyle(
                            fontSize: 18,
                            height: 1.22,
                            color: Color(0xFF0D0D0E),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Size ${widget.cartItem.productSize}',
                          style: const TextStyle(color: Color(0xFF797780)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.cartItem.productPrice,
                          style: const TextStyle(
                            fontSize: 24,
                            letterSpacing: -0.78,
                            color: Color(0xFF0D0D0E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ), // Jarak antara deskripsi produk dan DateSelector
          DateSelector(onDateSelected: _handleDateSelection),
          const SizedBox(
            height: 8,
          ), // Jarak antara DateSelector dan QuantitySelector
          QuantitySelector(
            initialQuantity: 0,
            onQuantityChanged: (newQuantity) {
              // Update logic for quantity here
              print('Quantity updated to: $newQuantity');
            },
          ),
        ],
      ),
    );
  }
}
