import 'package:e7twa2/network/network.dart';
import 'package:e7twa2/profile/data/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController {
  NetWork netWork = NetWork();
  ProfileModel _profileModel =ProfileModel();
  Future<ProfileModel> getProfile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("api_token"));
    var data = await netWork.getData(url: 'parentprofile',
        headers: {
          'Accept':'application/json',
          "Authorization":"Bearer ${_prefs.getString("api_token")}",
        });
    print(data);
    if (data == null || data == "internet") {
      _profileModel = null;
      return  _profileModel;
    } else {
      _profileModel = ProfileModel.fromJson(data);
      print(data);
      return  _profileModel;
    }
  }
  Future<ProfileModel> getDrProfile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("api_token"));
    var data = await netWork.getData(url: 'doctorprofile',
        headers: {
          'Accept':'application/json',
          "Authorization":"Bearer ${_prefs.getString("api_token")}",
        });
    print(data);
    if (data == null || data == "internet") {
      _profileModel = null;
      return  _profileModel;
    } else {
      _profileModel = ProfileModel.fromJson(data);
      print(data);
      return  _profileModel;
    }
  }
}
