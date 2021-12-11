import 'package:dio/dio.dart';
import 'package:e7twa2/network/network.dart';
import 'package:e7twa2/perceptions/model.dart';

import '../shared_preferences.dart';

class MedicineAlarmController {

  NetWork _netWork = NetWork();

  Future<int> addAlarm(
      {String startDate, String endDate, String days, String time})async{
    final token = await SharedHelper.getToken();
    final formData = FormData.fromMap({
      'days':days,
      'start_date':startDate,
      'end_date':endDate,
      'time':time,
    });
    final response = await _netWork.postData(url: 'addmedicineealarm',headers: {
      'Authorization':'Bearer $token'
    },
        formData: formData);
    print(response);
    MyMedicineAlarmsModel _model = MyMedicineAlarmsModel.fromJson(response);
    return _model.data.last.id;
  }
}