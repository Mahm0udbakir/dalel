import 'package:dalel/core/global_states/global_states.dart';

abstract class AuthStates extends GlobalState {}

final class AuthInitial extends AuthStates {}

//! Sign Up States
final class SignUpSuccessState extends AuthStates
    implements GlobalSuccessState {
  @override
  final String? successMessage;
  SignUpSuccessState({this.successMessage});
  @override
  dynamic get data => null;
  @override
  String? get message => successMessage;
}

final class SignUpLoadingState extends AuthStates
    implements GlobalLoadingState {
  @override
  final String? loadingMessage;
  SignUpLoadingState({this.loadingMessage});
}

final class SignUpErrorState extends AuthStates implements GlobalErrorState {
  @override
  final String? errorMessage;
  SignUpErrorState({this.errorMessage});
  @override
  String? get message => errorMessage;
}

//! Sign In States
final class SignInSuccessState extends AuthStates
    implements GlobalSuccessState {
  @override
  final String? successMessage;
  SignInSuccessState({this.successMessage});
  @override
  dynamic get data => null;
  @override
  String? get message => successMessage;
}

final class SignInLoadingState extends AuthStates
    implements GlobalLoadingState {
  @override
  final String? loadingMessage;
  SignInLoadingState({this.loadingMessage});
}

final class SignInErrorState extends AuthStates implements GlobalErrorState {
  @override
  final String? errorMessage;
  SignInErrorState({this.errorMessage});
  @override
  String? get message => errorMessage;
}

//! Forgot Password States
final class ForgotPasswordSuccessState extends AuthStates
    implements GlobalSuccessState {
  @override
  final String? successMessage;
  ForgotPasswordSuccessState({this.successMessage});
  @override
  dynamic get data => null;
  @override
  String? get message => successMessage;
}

final class ForgotPasswordLoadingState extends AuthStates
    implements GlobalLoadingState {
  @override
  final String? loadingMessage;
  ForgotPasswordLoadingState({this.loadingMessage});
}

final class ForgotPasswordErrorState extends AuthStates
    implements GlobalErrorState {
  @override
  final String? errorMessage;
  ForgotPasswordErrorState({this.errorMessage});
  @override
  String? get message => errorMessage;
}

//! Other States
final class TermsAndConditionsCheckedState extends AuthStates {}

final class PasswordVisibilityChangedState extends AuthStates {}
