import 'package:dalel/features/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

successSnackBar(BuildContext context) {
  showTopSnackBar(
    Overlay.of(context),
    const CustomSnackBar.success(
      message: "Account created successfully",
    ),
  );
}

errorSnackBar(BuildContext context, SignUpErrorState state) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: state.errorMessage,
    ),
  );
}
