import 'package:dalel/features/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  bool termsAndConditionsChecked = false;
  bool passwordVisible = false;

  final GlobalKey<FormState> authFormKey = GlobalKey<FormState>();

  signIUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpErrorState(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpErrorState(
            errorMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignUpErrorState(errorMessage: e.toString()));
    }
  }

  termsAndConditionsCheck({required checkedOrNot}) {
    termsAndConditionsChecked = checkedOrNot;
    emit(TermsAndConditionsCheckedState());
  }

  togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    emit(PasswordVisiblityChangedState());
  }
}
