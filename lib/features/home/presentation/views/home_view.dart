import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_text_header.dart';
import 'package:dalel/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:dalel/features/home/presentation/widgets/historical_characters_section.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods_section.dart';
import 'package:dalel/features/home/presentation/widgets/historical_souvenirs_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CustomHomeViewAppBar(),
            ),
            SliverToBoxAdapter(
              child: CustomTextHeader(text: MyAppStrings.historicalPeriods),
            ),
            SliverToBoxAdapter(
              child: HistoryicalPeriodsSection(),
            ),
            SliverToBoxAdapter(
              child: CustomTextHeader(text: MyAppStrings.historicalCharacters),
            ),
            SliverToBoxAdapter(
              child: HistoricalCharactersSection(),
            ),
            SliverToBoxAdapter(
              child: CustomTextHeader(text: MyAppStrings.historicalSouvenirs),
            ),
            SliverToBoxAdapter(
              child: HistoricalSouvenirsSection(),
            ),
          ],
        ),
      ),
    );
  }
}
