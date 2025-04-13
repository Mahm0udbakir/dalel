import 'package:dalel/features/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  bool termsAndConditionsChecked = false;
  bool passwordVisible = false;

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  signUpWithEmailAndPassword() async {
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

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many attempts. Please try again later.';
          break;
        case 'invalid-credential':
          errorMessage =
              'Invalid credentials. Please check your email and password.';
          break;
        default:
          errorMessage = 'Sign-in failed: ${e.message ?? e.code}';
      }
      emit(SignInErrorState(errorMessage: errorMessage));
    } catch (e) {
      emit(SignInErrorState(errorMessage: 'An unexpected error occurred: $e'));
    }
  }

  termsAndConditionsCheck({required value}) {
    termsAndConditionsChecked = value;
    emit(TermsAndConditionsCheckedState());
  }

  togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    emit(PasswordVisiblityChangedState());
  }
}
