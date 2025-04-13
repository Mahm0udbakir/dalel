import 'package:dalel/core/functions/custom_snackbar.dart';
import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    var myAuthCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (BuildContext context, state) {
        if (state is SignInErrorState) {
          errorSnackBar(context, state);
        } else if (state is SignInSuccessState) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            successSnackBar(context, state);
            navigateWithOutBackButton(context, '/home');
          } else {
            infoSnackBar(context,
                "This email is not verified yet, please check your email and verify it.");
          }
        }
      },
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
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
                const CustomForgotPassword(),
                const SizedBox(height: 102),
                state is SignInLoadingState
                    ? SpinKitCubeGrid(
                        color: MyAppColors.primaryColor,
                        size: 35,
                      )
                    : CustomButton(
                        text: MyAppStrings.signIn,
                        onPressed: () {
                          if (myAuthCubit.signInFormKey.currentState!
                              .validate()) {
                            myAuthCubit.signInWithEmailAndPassword();
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
