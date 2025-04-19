import 'package:dalel/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShrimmer extends StatelessWidget {
  const CustomShrimmer({
    super.key,
     this.height,
     this.shimmerContainer,
     this.separatorItem,
  });

  final double? height;
  final Widget? shimmerContainer;
  final Widget? separatorItem;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyAppColors.grey,
      highlightColor: Colors.white60,
      child: SizedBox(
        height: height,
        child: ListView.separated(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return shimmerContainer;
          },
          separatorBuilder: (BuildContext context, int index) {
            return separatorItem!;
          },
          itemCount: 6,
        ),
      ),
    );
  }
}
