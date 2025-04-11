class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpErrorState extends AuthState {
  final String errorMessage;
  SignUpErrorState({required this.errorMessage});
}

final class TermsAndConditionsCheckedState extends AuthState {}

final class PasswordVisiblityChangedState extends AuthState {}
