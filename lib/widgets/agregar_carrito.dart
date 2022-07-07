import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/custom_widgets.dart';

class AgregarCarrito extends StatelessWidget {
  final double? monto;
  const AgregarCarrito({
    Key? key,
    this.monto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Row(
        children: [
          const SizedBox(width: 24),
          Text(
            '\$$monto',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          const CustomButton(titulo: 'Add to cart'),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
