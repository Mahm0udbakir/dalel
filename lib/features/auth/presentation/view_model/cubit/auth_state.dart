class AuthStates {}

final class AuthInitial extends AuthStates {}

abstract class ErrorState extends AuthStates {
  String get errorMessage;
}

final class SignUpSuccessState extends AuthStates {}

final class SignUpLoadingState extends AuthStates {}

final class SignUpErrorState extends ErrorState {
  @override
  final String errorMessage;
  SignUpErrorState({required this.errorMessage});
}

final class SignInSuccessState extends AuthStates {}

final class SignInLoadingState extends AuthStates {}

final class SignInErrorState extends ErrorState {
  @override
  final String errorMessage;
  SignInErrorState({required this.errorMessage});
}

final class TermsAndConditionsCheckedState extends AuthStates {}

final class PasswordVisiblityChangedState extends AuthStates {}
