import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:flutter/material.dart';

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyAppColors.offWhite,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
