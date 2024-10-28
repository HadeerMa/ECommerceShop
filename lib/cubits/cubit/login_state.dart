abstract class loginstate {}

class loginstateInitial extends loginstate {}

class loginstateSuccess extends loginstate {}

class loginstateLoading extends loginstate {}

class loginstateError extends loginstate {
  String message;
  loginstateError({required this.message});
}
