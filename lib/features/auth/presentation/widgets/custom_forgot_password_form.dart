import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    var myAuthCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: myAuthCubit.forgotPasswordFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  text: MyAppStrings.emailAddress,
                  onChanged: (email) {
                    myAuthCubit.email = email;
                  },
                ),
                const SizedBox(height: 129),
                state is SignInLoadingState
                    ? SpinKitCubeGrid(
                        color: MyAppColors.primaryColor,
                        size: 35,
                      )
                    : CustomButton(
                        text: MyAppStrings.sendResetPasswordLink,
                        onPressed: () {},
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
