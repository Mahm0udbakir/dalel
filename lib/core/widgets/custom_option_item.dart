import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 170,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: MyAppColors.grey,
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: Column(
        children: [
          Container(
            height: 124,
            width: 95,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              image: DecorationImage(
                image: AssetImage(MyAppAssets.assetsImagesOnBoarding2),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            "Lion King",
            style: MyAppTextStyles.poppins500size16.copyWith(
              color: MyAppColors.deepBrown,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
