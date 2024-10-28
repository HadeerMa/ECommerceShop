abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupLoading extends SignupState {}

class SignupError extends SignupState {
  String message;
  SignupError({required this.message});
}