import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 28),
            ),
            SliverToBoxAdapter(
              child: CustomHomeViewAppBar(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
            SliverToBoxAdapter(
              child: CustomTextHeader(text: MyAppStrings.historicalPeriods),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            SliverToBoxAdapter(
              child: HistoricalPeriods(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomHomeViewAppBar extends StatelessWidget {
  const CustomHomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(MyAppAssets.assetsImagesMenu),
        CustomTextWidget(
          text: MyAppStrings.appName,
          style: MyAppTextStyles.pacifico400size30,
        )
      ],
    );
  }
}

class CustomTextHeader extends StatelessWidget {
  const CustomTextHeader({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MyAppTextStyles.poppins500size20,
    );
  }
}

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalPeriodItem(),
        HistoricalPeriodItem(),
      ],
    );
  }
}

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 163,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage(MyAppAssets.assetsImagesSuccess),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
