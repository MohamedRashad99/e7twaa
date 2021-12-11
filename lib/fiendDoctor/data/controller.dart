import 'package:e7twa2/fiendDoctor/data/model.dart';
import 'package:e7twa2/network/network.dart';
import 'package:e7twa2/profile/data/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllDocController {
  NetWork netWork = NetWork();
  DoctorModel _doctorModel=DoctorModel();
  Future<DoctorModel> getAllDoc() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("api_token"));
    var data = await netWork.getData(url: 'alldoctors');
    print(data);
    if (data == null || data == "internet") {
      _doctorModel = null;
      return  _doctorModel;
    } else {
      _doctorModel = DoctorModel.fromJson(data);
      print(data);
      return  _doctorModel;
    }
  }
}
