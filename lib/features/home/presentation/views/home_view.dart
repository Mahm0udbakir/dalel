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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomHomeViewAppBar(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: HistoricalPeriodsSection(),
            ),
            SliverToBoxAdapter(
              child: HistoricalCharactersSection(),
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
