abstract class VaState {}

class VaInitState extends VaState {}

class VaSuccessState extends VaState {}

class VaLoadingState extends VaState {}

class VaErrorState extends VaState {
  String error;
  VaErrorState(this.error);
}