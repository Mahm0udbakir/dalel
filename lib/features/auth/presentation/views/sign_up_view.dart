import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_sign_up_form.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an_account.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
            const SliverToBoxAdapter(
                child: WelcomeTextWidget(text: MyAppStrings.welcome)),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(child: CustomSignUpForm()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: HaveAnAccount(
                text1: MyAppStrings.alreadyHaveAnAccount,
                text2: MyAppStrings.signIn,
                onTap: () {
                  navigateWithOutBackButton(context, '/signIn');
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 17)),
          ],
        ),
      ),
    );
  }
}
