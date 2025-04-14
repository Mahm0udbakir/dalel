import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_forgot_password_form.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot_password_image.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot_password_subtitle.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 108)),
          SliverToBoxAdapter(
              child: CustomTextWidget(text: MyAppStrings.forgotPassword)),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: ForgotPasswordImage()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: ForgotPasswordSubTitle()),
          SliverToBoxAdapter(child: SizedBox(height: 41)),
          SliverToBoxAdapter(child: CustomForgotPasswordForm()),
          SliverToBoxAdapter(child: SizedBox(height: 17)),
        ],
      ),
    );
  }
}
