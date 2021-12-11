import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e7twa2/forgetPassword/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetCubit extends Cubit<ForgetState>{
  ForgetCubit() : super(ForgetInitState());
  static ForgetCubit get (context)=> BlocProvider.of(context);
  Dio _dio = Dio();
  String email;

  Future<void> forget()async{
    emit(ForgetLoadingState());
    try{
      final url = 'http://ehtwa.jeeet.net/api/sendVerifyForgetPasswordNum';
      FormData formData = FormData.fromMap({
        "email":email,

      });
      final Response response = await _dio.post(url,data: formData,);
      if(response.statusCode == 200&&response.data['msg']=="success"){
        print(response.data);
        emit(ForgetSuccessState());
      }else if(response.statusCode == 200&&response.data['msg']=="error"){
        emit(ForgetErrorState("check your email"));
      }
    }catch(e){
      if(e.response!=null)
        emit(ForgetErrorState(e));
    }
  }
}