import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e7twa2/signUp/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpControllerCubit extends Cubit<SignUpState>{
  SignUpControllerCubit() : super(SignUpInitState());
  static SignUpControllerCubit get (context)=> BlocProvider.of(context);
  Dio _dio = Dio();
  //parent
  String babyName;
  String doctorName;
  String parentName;
  var phone;
  var password;
  String sex;
  String email;
  String specialization;
  var date;
  Future<void> signUp()async{
    emit(SignUpLoadingState());

    try{
      final url = 'http://ehtwa.jeeet.net/api/parentregister';
      FormData formData = FormData.fromMap({
        "phone":"+966${phone}",
        "password":"${password}",
        "email":email,
        "date_of_birth":date,
        "baby_name":babyName,
        "user_name":parentName,
        "sex":sex,

      });
      final Response response = await _dio.post(url,data: formData,);
      if(response.statusCode!=null&&response.statusCode == 200&&response.data['msg']=="success"){
        print("تمام يا صاحبى");
        print(response.data);
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("api_token",response.data["api_token"]);
        _prefs.setInt("id",response.data["data"]["user"]["id"]);
        print(response.data["data"]["user"]["id"]);
        print(response.data["data"]["user"]["type"]);
        _prefs.setString("type",response.data["data"]["user"]["type"]);
        emit(SignUpSuccessState());
      }else if(response.statusCode == 200&&response.data['msg']=="error"){
        print("مش تمام يا صاحبى");
        print(response.data['msg']);
        emit(SignUpErrorState("The phone has already been taken"));
      }
    }catch( e){
      if(e.response!=null)
        emit(SignUpErrorState(e.toString()));
    }

  }
  Future<void> signUpAsDoctor()async{
    emit(DocLoadingState());

    try{
      final url = 'http://ehtwa.jeeet.net/api/doctorregister';
      FormData formData = FormData.fromMap({
        "phone":"+966${phone}",
        "password":"${password}",
        "email":email,
        "specialization":"${specialization}",
        "padiatrician_name":doctorName,
        "user_name":parentName,
        "sex":sex,

      });
      final Response response = await _dio.post(url,data: formData,);
      if(response.statusCode!=null&&response.statusCode == 200&&response.data['msg']=="success"){
        print("تمام يا صاحبى");
        print(response.data);
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("api_token",response.data["api_token"]);
        _prefs.setInt("id",response.data["data"]["user"]["id"]);
        _prefs.setString("type",response.data["data"]["user"]["type"]);
        emit(DocSuccessState());
      }else if(response.statusCode == 200&&response.data['msg']=="error"){
        print("مش تمام يا صاحبى");
        print(response.data['msg']);
        emit(DocErrorState("The phone or mail  has already been taken"));
      }
    }catch( e){
      if(e.response!=null)
        emit(DocErrorState(e.toString()));
    }

  }

}