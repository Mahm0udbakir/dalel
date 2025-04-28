import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_option_item.dart';
import 'package:dalel/core/widgets/custom_list_view.dart';
import 'package:dalel/core/widgets/custom_text_header.dart';
import 'package:dalel/features/home/data/model/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextHeader(text: MyAppStrings.historicalPeriods),
        const SizedBox(height: 16),
        CustomListView<HistoricalPeriodsModel, HomeCubit, HomeStates>(
          cubit: context.read<HomeCubit>(),
          height: 96,
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
        const SizedBox(height: 32),
      ],
    );
  }
}
