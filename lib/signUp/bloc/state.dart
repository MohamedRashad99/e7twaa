abstract class SignUpState {}

class SignUpInitState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  String error;
  SignUpErrorState(this.error);
}

class DocInitState extends SignUpState {}

class DocSuccessState extends SignUpState {}

class DocLoadingState extends SignUpState {}

class DocErrorState extends SignUpState {
  String error;
  DocErrorState(this.error);
}