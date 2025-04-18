import 'package:dalel/core/widgets/custom_card_item.dart';
import 'package:flutter/material.dart';

class HistoryicalPeriodsSection extends StatelessWidget {
  const HistoryicalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardItem(),
            CardItem(),
          ],
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
