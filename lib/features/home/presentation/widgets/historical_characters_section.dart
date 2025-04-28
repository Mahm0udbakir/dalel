import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_card_item.dart';
import 'package:dalel/core/widgets/custom_list_view.dart';
import 'package:dalel/core/widgets/custom_text_header.dart';
import 'package:dalel/features/home/data/model/historical_characters_model.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextHeader(text: MyAppStrings.historicalCharacters),
        const SizedBox(height: 16),
        CustomListView<HistoricalCharactersModel, HomeCubit, HomeStates>(
          height: 170,
          cubit: context.read<HomeCubit>(),
          getData: (state) {
            if (state is HistoricalCharactersSuccessState) {
              return state.historicalCharacters;
            }
            return [];
          },
          itemBuilder: (context, index, model) {
            return CardItem(model: model);
          },
          shimmerContainer: const CardItem(),
          separatorItem: const SizedBox(width: 16),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
