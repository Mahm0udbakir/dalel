import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    var myAuthCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Form(
          key: myAuthCubit.authFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                text: MyAppStrings.firstName,
                onFieldSubmitted: (firstName) {
                  myAuthCubit.firstName = firstName;
                },
              ),
              CustomTextFormField(
                text: MyAppStrings.lastName,
                onFieldSubmitted: (lastName) {
                  myAuthCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                text: MyAppStrings.emailAddress,
                onFieldSubmitted: (email) {
                  myAuthCubit.email = email;
                },
              ),
              CustomTextFormField(
                text: MyAppStrings.password,
                isPassword: true,
                onFieldSubmitted: (password) {
                  myAuthCubit.password = password;
                },
              ),
              const TermsAndConditions(),
              const SizedBox(height: 88),
              CustomButton(
                text: MyAppStrings.signUp,
                color: myAuthCubit.termsAndConditionsChecked
                    ? MyAppColors.primaryColor
                    : MyAppColors.grey,
                onPressed: () {
                  if (myAuthCubit.termsAndConditionsChecked) {
                    if (myAuthCubit.authFormKey.currentState!.validate()) {
                      myAuthCubit.signIUpWithEmailAndPassword();
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
