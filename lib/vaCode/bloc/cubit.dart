import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e7twa2/signIn/bloc/state.dart';
import 'package:e7twa2/vaCode/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VaControllerCubit extends Cubit<VaState>{
  VaControllerCubit() : super(VaInitState());
  static VaControllerCubit get (context)=> BlocProvider.of(context);
  Dio _dio = Dio();
  String email;
  String code;

  Future<void> sendVa()async{
    emit(VaLoadingState());
    print(email);
    print(code);
    try{
      final url = 'http://ehtwa.jeeet.net/api/verifyForgetPassword';
      FormData formData = FormData.fromMap({
        "email":email,
        "code":code,
      });
      final Response response = await _dio.post(url,data: formData,);
      if(response.statusCode == 200&&response.data['msg']=="success"){
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("type", response.data['data']['user']['type']);
        _prefs.setString("api_token",response.data['data']['user']['api_token']);
        print(_prefs.getString('type'));
        print(response.data);
        emit(VaSuccessState());
      }else if(response.statusCode == 200&&response.data['msg']=="error"){
        emit(VaErrorState("check your phone or password"));
      }
    }catch(e){
      if(e.response!=null)
        emit(VaErrorState(e));
    }
  }
}