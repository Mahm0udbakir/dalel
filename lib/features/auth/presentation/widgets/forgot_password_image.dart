import 'package:dalel/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordImage extends StatelessWidget {
  const ForgotPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 253,
      width: 253,
      child: Image(
        image: AssetImage(MyAppAssets.assetsImagesForgotPassword2),
      ),
    );
  }
}
