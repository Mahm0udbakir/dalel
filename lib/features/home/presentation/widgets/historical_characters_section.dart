import 'package:dalel/core/widgets/custom_option_item.dart';
import 'package:dalel/core/widgets/custom_options_list_view.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 16),
 
        CustomOptionsListView(itemCount: 6, item: OptionItem()),
        SizedBox(height: 32),
      ],
    );
  }
}
