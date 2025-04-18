import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_list_view.dart';
import 'package:dalel/core/widgets/custom_option_item.dart';
import 'package:dalel/core/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextHeader(text: MyAppStrings.historicalSouvenirs),
        const SizedBox(height: 16),
        CustomListView(
          //still need to add the firebasestrings and the collecton itself
          future: FirebaseFirestore.instance
              .collection(MyAppStrings.historicalSouvenirs)
              .get(),
          //temporary
          itemBuilder: (context, index, data) {
            return OptionItem(
              name: data['name'] ?? 'Unknown Period',
              image: data['image'] ?? MyAppAssets.assetsImagesOnBoarding2,
            );
          },
          height: 170,
          separatorItem: const SizedBox(width: 16),
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
