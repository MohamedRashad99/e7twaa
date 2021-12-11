abstract class OrderState {}

class OrderInitState extends OrderState {}

class OrderSuccessState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderErrorState extends OrderState {
  String error;
  OrderErrorState(this.error);
}



