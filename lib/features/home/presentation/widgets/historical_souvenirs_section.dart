import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_card_item.dart';
import 'package:dalel/core/widgets/custom_list_view.dart';
import 'package:dalel/core/widgets/custom_text_header.dart';
import 'package:dalel/features/home/data/model/historical_souvenirs_model.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextHeader(text: MyAppStrings.historicalSouvenirs),
        const SizedBox(height: 16),
        CustomListView<HistoricalSouvenirsModel, HomeCubit, HomeStates>(
          cubit: context.read<HomeCubit>(),
          height: 170,
          itemBuilder: (context, index, model) {
            return CardItem(model: model);
          },
          separatorItem: const SizedBox(width: 16),
          shimmerContainer: const CardItem(),
          getData: (state) {
            if (state is HomeSuccessState) {
              return state.historicalSouvenirs!;
            }
            return [];
          },
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
