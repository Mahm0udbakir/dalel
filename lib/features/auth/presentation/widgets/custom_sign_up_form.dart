import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Form(
        child: Column(
          children: [
            CustomTextFormField(
              text: MyAppStrings.firstName,
              onFieldSubmitted: (firstName) {
                context.read<AuthCubit>().firstName = firstName;
              },
            ),
            CustomTextFormField(
              text: MyAppStrings.lastName,
              onFieldSubmitted: (lastName) {
                context.read<AuthCubit>().lastName = lastName;
              },
            ),
            CustomTextFormField(
              text: MyAppStrings.emailAddress,
              onFieldSubmitted: (email) {
                context.read<AuthCubit>().email = email;
              },
            ),
            CustomTextFormField(
              text: MyAppStrings.password,
              onFieldSubmitted: (password) {
                context.read<AuthCubit>().password = password;
              },
            ),
            const TermsAndConditions(),
            const SizedBox(height: 88),
            CustomButton(
                text: MyAppStrings.signUp,
                onPressed: () {
                  context.read<AuthCubit>().signIUpWithEmailAndPassword();
                }),
          ],
        ),
      ),
    );
  }
}
