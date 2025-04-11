import 'package:dalel/core/functions/custom_snackbar.dart';
import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    var myAuthCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (BuildContext context, state) {
        if (state is SignUpErrorState) {
          errorSnackBar(context, state);
        } else if (state is SignUpSuccessState) {
          successSnackBar(context);
          navigateWithOutBackButton(context, '/home');
        }
      },
      builder: (BuildContext context, state) {
        return Form(
          key: myAuthCubit.authFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                text: MyAppStrings.firstName,
                onChanged: (firstName) {
                  myAuthCubit.firstName = firstName;
                },
              ),
              CustomTextFormField(
                text: MyAppStrings.lastName,
                onChanged: (lastName) {
                  myAuthCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                text: MyAppStrings.emailAddress,
                onChanged: (email) {
                  myAuthCubit.email = email;
                },
              ),
              CustomTextFormField(
                text: MyAppStrings.password,
                isPassword: true,
                onChanged: (password) {
                  myAuthCubit.password = password;
                },
              ),
              const TermsAndConditions(),
              const SizedBox(height: 88),
              state is SignUpLoadingState
                  ? SpinKitCubeGrid(
                      color: MyAppColors.primaryColor,
                      size: 50.0,
                    )
                  : CustomButton(
                      text: MyAppStrings.signUp,
                      color: myAuthCubit.termsAndConditionsChecked
                          ? MyAppColors.primaryColor
                          : MyAppColors.grey,
                      onPressed: () {
                        if (myAuthCubit.termsAndConditionsChecked) {
                          if (myAuthCubit.authFormKey.currentState!
                              .validate()) {
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
