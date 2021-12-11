import 'package:e7twa2/DrAppoint/model.dart';
import 'package:e7twa2/fiendDoctor/data/model.dart';
import 'package:e7twa2/network/network.dart';
import 'package:e7twa2/profile/data/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrAppController {
  NetWork netWork = NetWork();
 DrAppointModel _drAppointModel =DrAppointModel();
  Future<DrAppointModel> getDrApp() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("api_token"));
    var data = await netWork.getData(url: 'doctorappointments',
        headers: {
      "Accept":"application/json",
      "Content-Type":"application/json",
      "Authorization":"Bearer ${_prefs.getString("api_token")}",
    });
    print(data);
    if (data == null || data == "internet") {
      _drAppointModel = null;
      return  _drAppointModel;
    } else {
      _drAppointModel = DrAppointModel.fromJson(data);
      print(data);
      return  _drAppointModel;
    }
  }
}
