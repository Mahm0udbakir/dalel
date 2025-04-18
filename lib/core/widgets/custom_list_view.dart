import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView(
      {super.key,
      required this.itemCount,
      required this.item,
      required this.height,
      required this.separatorItem});

  final int itemCount;
  final double height;
  final Widget item;
  final Widget separatorItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(
          builder: (context) {
            return SizedBox(
              height: height,
              child: ListView.separated(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return item;
                },
                separatorBuilder: (BuildContext context, int index) {
                  return separatorItem;
                },
                itemCount: itemCount,
              ),
            );
          }
        ),
      ],
    );
  }
}
