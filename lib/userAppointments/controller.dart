import 'package:e7twa2/network/network.dart';
import 'package:e7twa2/shared_preferences.dart';
import 'package:e7twa2/userAppointments/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAppointmentsController {

  NetWork _netWork = NetWork();
  UserAppointmentsModel _userAppointmentsModel = UserAppointmentsModel();
  Future<UserAppointmentsModel> getMyAppointments()async{

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final response = await _netWork.getData(
      url: 'myappointments',
      headers: {
        "Authorization": "Bearer ${_prefs.getString("api_token")}",      }
    );
    _userAppointmentsModel = UserAppointmentsModel.fromJson(response);
    return _userAppointmentsModel;
  }

}