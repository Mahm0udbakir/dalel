import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_option_item.dart';
import 'package:dalel/core/widgets/custom_list_view.dart';
import 'package:dalel/core/widgets/custom_text_header.dart';
import 'package:dalel/features/home/data/model/historical_periods_model.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextHeader(text: MyAppStrings.historicalPeriods),
        const SizedBox(height: 16),
        CustomListView(
          height: 96,
          future: FirebaseFirestore.instance
              .collection(MyFireBaseStrings.historicalPeriods)
              .get(),
          itemBuilder: (context, index, data) {
            final model = HistoricalPeriodsModel.fromJson(data);
            return OptionItem(historicalPeriodsModel: model);
          },
          separatorItem: const SizedBox(width: 16),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
