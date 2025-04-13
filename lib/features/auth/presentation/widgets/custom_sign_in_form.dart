import 'package:dalel/core/functions/custom_snackbar.dart';
import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/views/forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    var myAuthCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Form(
          key: myAuthCubit.signInFormKey,
          child: Column(
            children: [
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
              const ForgotPasswordView(),
              const SizedBox(height: 88),
              state is SignInLoadingState
                  ? SpinKitCubeGrid(
                      color: MyAppColors.primaryColor,
                      size: 35,
                    )
                  : CustomButton(
                      text: MyAppStrings.signIn,
                      onPressed: () {
                        if (myAuthCubit.signInFormKey.currentState!
                            .validate()) {}
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          navigateWithBackButton(context, '/forgetPassword');
        },
        child: Text(
          MyAppStrings.forgotPassword,
          style: MyAppTextStyles.poppins600size28.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
