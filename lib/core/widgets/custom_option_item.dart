import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:dalel/features/home/data/model/historical_periods_model.dart';
import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({super.key,required this.historicalPeriodsModel});
  final HistoricalPeriodsModel historicalPeriodsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 196,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 48,
              width: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                historicalPeriodsModel.name ?? 'Unknown Period',
                style: MyAppTextStyles.poppins500size16.copyWith(
                  color: MyAppColors.deepBrown,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 64,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                historicalPeriodsModel.image ?? 'Unknown Period',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
