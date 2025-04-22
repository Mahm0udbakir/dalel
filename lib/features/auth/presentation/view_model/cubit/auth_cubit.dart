import 'package:cloud_firestore/cloud_firestore.dart';
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
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      await addUser();
      await verifyEmail();
      await FirebaseAuth.instance.signOut();
      emit(SignUpSuccessState(
          successMessage: 'Account created successfully!, Please verify'));
    } on FirebaseAuthException catch (e) {
      _signUpHandleExceptions(e);
    } catch (e) {
      emit(SignUpErrorState(errorMessage: e.toString()));
    }
  }

  void _signUpHandleExceptions(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SignUpErrorState(
          errorMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignUpErrorState(
          errorMessage: 'The account already exists for that email.'));
    } else {
      emit(SignUpErrorState(errorMessage: e.code));
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(SignInSuccessState(successMessage: 'Sign-in successful!'));
    } on FirebaseAuthException catch (e) {
      _signInHandleExceptions(e);
    } catch (e) {
      emit(SignInErrorState(errorMessage: 'An unexpected error occurred: $e'));
    }
  }

  void _signInHandleExceptions(FirebaseAuthException e) {
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
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  void termsAndConditionsCheck({required value}) {
    termsAndConditionsChecked = value;
    emit(TermsAndConditionsCheckedState());
  }

  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    emit(PasswordVisibilityChangedState());
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ForgotPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      emit(ForgotPasswordSuccessState(
          successMessage: 'Password reset link sent to your email.'));
    } on FirebaseAuthException catch (e) {
      emit(ForgotPasswordErrorState(errorMessage: e.code));
    } catch (e) {
      emit(ForgotPasswordErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    });
  }
}
