class AuthStates {}

final class AuthInitial extends AuthStates {}

final class SignUpSuccessState extends AuthStates {}

final class SignUpLoadingState extends AuthStates {}

final class SignUpErrorState extends AuthStates {
  final String errorMessage;
  SignUpErrorState({required this.errorMessage});
}

final class TermsAndConditionsCheckedState extends AuthStates {}

final class PasswordVisiblityChangedState extends AuthStates {}
