import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_list_view.dart';
import 'package:dalel/core/widgets/custom_option_item.dart';
import 'package:dalel/core/widgets/custom_text_header.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_state.dart';
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
          height: 96,
          cubit: HomeCubit(),
          getData: (state) {
            if (state is HistoricalPeriodSuccessState) {
              return state.historicalPeriods;
            }
            return [];
          },
          itemBuilder: (context, index, model) {
            return OptionItem(
              model: model,
            );
          },
          separatorItem: const SizedBox(width: 16),
          shimmerContainer: const OptionItem(),
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
