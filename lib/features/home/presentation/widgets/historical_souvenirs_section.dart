import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_option_item.dart';
import 'package:dalel/core/widgets/custom_list_view.dart';
import 'package:dalel/core/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextHeader(text: MyAppStrings.historicalSouvenirs),
        SizedBox(height: 16),
        CustomListView(
            itemCount: 6,
            item: CardItem(),
            height: 170,
            separatorItem: SizedBox(width: 16)),
        SizedBox(height: 64),
      ],
    );
  }
}
