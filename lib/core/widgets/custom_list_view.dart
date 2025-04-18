import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomListView extends StatelessWidget {
  const CustomListView(
      {super.key,
      required this.itemBuilder,
      required this.height,
      required this.separatorItem,
      required this.future});

  final double height;
  final Widget Function(BuildContext, int, Map<String, dynamic>) itemBuilder;
  final Widget separatorItem;
  final Future<QuerySnapshot<Map<String, dynamic>>> future;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
              return const Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SpinKitCubeGrid(
                  color: MyAppColors.primaryColor,
                  size: 35,
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              final documents = snapshot.data!.docs;
              return SizedBox(
                height: height,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final data = documents[index].data();
                    return itemBuilder(context, index, data);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return separatorItem;
                  },
                  itemCount: documents.length,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
