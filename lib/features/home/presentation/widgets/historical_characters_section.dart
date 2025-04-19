import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_card_item.dart';
import 'package:dalel/core/widgets/custom_list_view.dart';
import 'package:dalel/core/widgets/custom_option_item.dart';
import 'package:dalel/core/widgets/custom_text_header.dart';
import 'package:dalel/features/home/data/model/historical_periods_model.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextHeader(text: MyAppStrings.historicalCharacters),
        const SizedBox(height: 16),
        CustomListView(
          //still need to add the firebasestrings and the collection itself
          future: FirebaseFirestore.instance
              .collection(MyAppStrings.historicalCharacters)
              .get(),
          //temporary
          itemBuilder: (context, index, data) {
            final model = HistoricalPeriodsModel.fromJson(data);
            return OptionItem(model: model);
          },
          height: 170,
          separatorItem: const SizedBox(width: 16),
          shimmerContainer: const CardItem(),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
