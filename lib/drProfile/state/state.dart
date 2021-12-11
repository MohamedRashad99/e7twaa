abstract class EditDrState {}

class EditInitState extends EditDrState {}

class EditSuccessState extends EditDrState {}

class EditLoadingState extends EditDrState {}

class EditErrorState extends EditDrState {
  String error;
  EditErrorState(this.error);
}