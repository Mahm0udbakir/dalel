import 'package:dalel/features/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

successSnackBar(BuildContext context, SuccessState state) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: state.successMessage,
    ),
  );
}

infoSnackBar(BuildContext context, String message) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(
      message: message,
    ),
  );
}

errorSnackBar(BuildContext context, ErrorState state) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: state.errorMessage,
    ),
  );
}
