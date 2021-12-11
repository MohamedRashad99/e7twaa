import 'package:dio/dio.dart';
import 'package:e7twa2/network/network.dart';
import 'package:e7twa2/shared_preferences.dart';
import 'package:e7twa2/vaccination/model.dart';

class VaccinesAlarm {

  NetWork _netWork  = NetWork();

  Future<int> addAlarm(String name,String time,String date)async{
    final token = await SharedHelper.getToken();
    final formData = FormData.fromMap({
      'vaccine':name,
      'time':time,
      'date':date
    });
    final response = await _netWork.postData(url: 'addvaccinealarm',headers: {
      'Authorization':'Bearer $token'
    },formData: formData);
    print(response);
    MyVaccineAlarmsModel _model = MyVaccineAlarmsModel.fromJson(response);
    return _model.data.last.id;
  }

}