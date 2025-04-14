class AuthStates {}

final class AuthInitial extends AuthStates {}

// Main States

abstract class SuccessState extends AuthStates {
  String get successMessage;
}

abstract class ErrorState extends AuthStates {
  String get errorMessage;
}

//! Sign Up States

final class SignUpSuccessState extends SuccessState {
  @override
  final String successMessage;
  SignUpSuccessState({required this.successMessage});
}

final class SignUpLoadingState extends AuthStates {}

final class SignUpErrorState extends ErrorState {
  @override
  final String errorMessage;
  SignUpErrorState({required this.errorMessage});
}

//! Sign In States

final class SignInSuccessState extends SuccessState {
  @override
  final String successMessage;
  SignInSuccessState({required this.successMessage});
}

final class SignInLoadingState extends AuthStates {}

final class SignInErrorState extends ErrorState {
  @override
  final String errorMessage;
  SignInErrorState({required this.errorMessage});
}


//! Forgot Password States

final class ForgotPasswordSuccessState extends SuccessState {
  @override
  final String successMessage;
  ForgotPasswordSuccessState({required this.successMessage});
}

final class ForgotPasswordLoadingState extends AuthStates {}

final class ForgotPasswordErrorState extends ErrorState {
  @override
  final String errorMessage;
  ForgotPasswordErrorState({required this.errorMessage});
}

//! Other States

final class TermsAndConditionsCheckedState extends AuthStates {}

final class PasswordVisiblityChangedState extends AuthStates {}
