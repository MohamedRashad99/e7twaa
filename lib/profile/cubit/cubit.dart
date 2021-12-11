import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e7twa2/profile/state/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileCubit extends Cubit<EditState>{
  EditProfileCubit() : super(EditInitState());
  static EditProfileCubit get(context)=>BlocProvider.of(context);


  String babyName;
  String parentName;
  var phone;
  var password;
  String sex;
  String email;
  var date;


  Dio _dio = Dio();

  Future<void> editProfile()async{

    emit(EditLoadingState());

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("api_token"));

    _dio.options.headers = {
      "Accept":"application/json",
      "Content-Type":"application/json",
      "Authorization":"Bearer ${_prefs.getString("api_token")}",
    };

    try{
      final url = 'http://ehtwa.jeeet.net/api/editparentprofile';
      FormData formData = FormData.fromMap({
        if(phone!=null)
        "phone":"+966${phone}",
        if(password!= null)
        "password":"${password}",
        if(email!=null)
        "email":email,
        if(date!=null)
        "date_of_birth":"${date}",
        if(babyName!=null)
        "baby_name":babyName,
        if(parentName!=null)
        "user_name":parentName,
        if(sex!=null)
        "sex":sex,
      });
      print("ثانيه يحب");
      final Response response = await _dio.post(url,data: formData,options: Options(contentType: "multipart/form-data"));
      if(response.statusCode!=null&&response.statusCode == 200&&response.data['msg']=="success"){
        emit(EditSuccessState());
      }else if(response.statusCode == 200&&response.data['msg']=="error"){
        emit(EditErrorState(response.data["data"]["phone"]));
      }
    }catch(e){
      if(e.response!=null)
        emit(EditErrorState(e.toString()));
    }
  }
}

