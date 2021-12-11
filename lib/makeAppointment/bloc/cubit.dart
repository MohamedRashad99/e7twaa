import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e7twa2/makeAppointment/bloc/state.dart';
import 'package:e7twa2/makeAppointment/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared_preferences.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitState());

  static OrderCubit get(context) => BlocProvider.of(context);
  TextEditingController controller = TextEditingController();

  AppointModel appointModel =AppointModel();
  Dio dio = Dio();

  Future<AppointModel> sendOrder({int id, String date,String time, String address,}) async {
    emit(OrderLoadingState());

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "Accept":"application/json",
      "Content-Type":"application/json",
      "Authorization": "Bearer ${_prefs.getString("api_token")}",
    };

    try {
      final url = 'http://ehtwa.jeeet.net/api/makeappointment';
      FormData formData = FormData.fromMap({
        'padiatrician_id': id,
        'address': address,
        'date': date,
        'time': time,
      });
      print("ثانيه يحب");
      final Response response = await dio.post(url,
          data: formData, options: Options(contentType: "multipart/form-data"));
      if (response.statusCode != null &&
          response.statusCode == 200 && response.data["msg"] == "success") {
        appointModel = AppointModel.fromJson(response.data);
        print(response.data);
        emit(OrderSuccessState());
      } else if( response.statusCode == 200 && response.data["msg"] == "error"){
        emit(OrderErrorState("The selected padiatrician id is invalid"));
      }
    } catch (e) {
      emit(OrderErrorState(e.toString()));
    }
    return appointModel;
  }
}
