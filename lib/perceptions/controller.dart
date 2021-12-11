import 'package:e7twa2/network/network.dart';
import 'package:e7twa2/perceptions/model.dart';
import 'package:e7twa2/shared_preferences.dart';
import 'package:e7twa2/vaccination/model.dart';

class MyMedicinesController {

  MyMedicineAlarmsModel _myMedicineAlarmsModel = MyMedicineAlarmsModel();
  NetWork _netWork = NetWork();

  Future<MyMedicineAlarmsModel> getMedicines()async{
    final token = await SharedHelper.getToken();
    final response = await _netWork.getData(url: 'mymedicinealarms',headers: {
      'Authorization':
          // 'Bearer TQPzTToNNw3cq64q6vzdAOt4YWH6ZfpecW2INxHjcd4iXk70hyrBQ64PUismWw8Ij13f7ay7q7rvc8MjrJGlk9GcrA0UE8UKlnXD'
      'Bearer $token'
    });
    _myMedicineAlarmsModel = MyMedicineAlarmsModel.fromJson(response);
    _myMedicineAlarmsModel.data.removeWhere((element) => element.id == 5);
    return _myMedicineAlarmsModel;
  }

}