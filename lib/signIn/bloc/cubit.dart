import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e7twa2/signIn/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginControllerCubit extends Cubit<LoginState>{
  LoginControllerCubit() : super(LoginInitState());
  static LoginControllerCubit get (context)=> BlocProvider.of(context);
  Dio _dio = Dio();
  String name;
  String password;

  Future<void> signIn()async{
    emit(LoginLoadingState());
    try{
      final url = 'http://ehtwa.jeeet.net/api/login';
      FormData formData = FormData.fromMap({
        "password":password,
        "user_name":name,
      });
      final Response response = await _dio.post(url,data: formData,);
      if(response.statusCode!=null&&response.statusCode == 200&&response.data['msg']=="success"){
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("api_token",response.data["api_token"]);
        _prefs.setInt("id",response.data["data"]["user"]["id"]);
        _prefs.setString("type",response.data["data"]["user"]["type"]);
        print(response.data);
        emit(LoginSuccessState());
      }else if(response.statusCode == 200&&response.data['msg']=="error"){
        emit(LoginErrorState("check your phone or password"));
      }
    }catch(e){
      if(e.response!=null)
        emit(LoginErrorState(e));
    }
  }
}