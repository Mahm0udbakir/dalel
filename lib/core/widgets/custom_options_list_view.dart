import 'package:flutter/material.dart';

class CustomOptionsListView extends StatelessWidget {
  const CustomOptionsListView(
      {super.key, required this.itemCount, required this.item});

  final int itemCount;
  final Widget item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170,
          child: ListView.separated(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return item;
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 16);
            },
            itemCount: itemCount,
          ),
        ),
      ],
    );
  }
}
