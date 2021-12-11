import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e7twa2/drProfile/state/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditDrCubit extends Cubit<EditDrState>{
  EditDrCubit() : super(EditInitState());
  static EditDrCubit get(context)=>BlocProvider.of(context);


  String doctorName;
  String userName;
  var phone;
  var password;
  String sex;
  String email;
  String specialization;


  Dio _dio = Dio();

  Future<void> editDr()async{

    emit(EditLoadingState());

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("api_token"));

    _dio.options.headers = {
      "Accept":"application/json",
      "Content-Type":"application/json",
      "Authorization":"Bearer ${_prefs.getString("api_token")}",
    };

    try{
      final url = 'http://ehtwa.jeeet.net/api/editdoctorprofile';
      FormData formData = FormData.fromMap({
        if(phone!=null)
        "phone":"+966${phone}",
        if(password!= null)
        "password":"${password}",
        if(userName!=null)
          "user_name":userName,
        if(email!=null)
        "email":email,
        if(specialization!=null)
        "specialization":"${specialization}",
        if(doctorName!=null)
        "padiatrician_name":doctorName,
        if(sex!=null)
        "sex":sex,
      });
      print("ثانيه يحب");
      final Response response = await _dio.post(url,data: formData,options: Options(contentType: "multipart/form-data"));
      if(response.statusCode!=null&&response.statusCode == 200&&response.data['msg']=="success"){
        emit(EditSuccessState());
      }else if(response.statusCode == 200&&response.data['msg']=="error"){
        emit(EditErrorState("error"));
      }
    }catch(e){
      if(e.response!=null)
        emit(EditErrorState(e.toString()));
    }
  }
}

