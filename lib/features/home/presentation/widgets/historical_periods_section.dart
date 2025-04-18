import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_card_item.dart';
import 'package:dalel/core/widgets/custom_list_view.dart';
import 'package:dalel/core/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';

class HistoryicalPeriodsSection extends StatelessWidget {
  const HistoryicalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextHeader(text: MyAppStrings.historicalPeriods),
        SizedBox(height: 16),
        CustomListView(
            itemCount: 3,
            item: OptionItem(),
            height: 96,
            separatorItem: SizedBox(width: 16)),
        SizedBox(height: 32),
      ],
    );
  }
}
