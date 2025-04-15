import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart view'),
      ),
      body: const Center(
        child: Text(
          'Cart view',
        ),
      ),
    );
  }
}
