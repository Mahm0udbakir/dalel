import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_text_form_field.dart';
import 'package:dalel/core/widgets/cutom_button.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an_account.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
            const SliverToBoxAdapter(child: WelcomeTextWidget()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(
              child: CustomTextFormField(text: MyAppStrings.firstName),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFormField(text: MyAppStrings.lastName),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFormField(text: MyAppStrings.emailAddress),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFormField(text: MyAppStrings.password),
            ),
            const SliverToBoxAdapter(child: TermsAndConditions()),
            const SliverToBoxAdapter(child: SizedBox(height: 88)),
            SliverToBoxAdapter(
                child:
                    CustomButton(text: MyAppStrings.signUp, onPressed: () {})),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
              child: HaveAnAccount(
                text1: MyAppStrings.alreadyHaveAnAccount,
                text2: MyAppStrings.signIn,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 17)),
          ],
        ),
      ),
    );
  }
}
