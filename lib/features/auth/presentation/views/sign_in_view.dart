import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_sign_in_banner.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_sign_in_form.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an_account.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CustomSignInBanner()),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          const SliverToBoxAdapter(child: CustomTextWidget(text: MyAppStrings.welcomeBack,)),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          const SliverToBoxAdapter(child: CustomSignInForm()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: HaveAnAccount(
              text1: MyAppStrings.dontHaveAnAccount,
              text2: MyAppStrings.signUp,
              onTap: () {
                navigateWithOutBackButton(context, '/signUp');
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 17)),
        ],
      ),
    );
  }
}

