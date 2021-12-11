import 'package:dio/dio.dart';
import 'package:e7twa2/DoctorProfile/model.dart';
import 'package:e7twa2/network/network.dart';
import 'package:e7twa2/shared_preferences.dart';
class DoctorProfileController {
  NetWork _netWork = NetWork();

  DoctorProfileModel _doctorProfileModel = DoctorProfileModel();

  Future<DoctorProfileModel> getDoctorProfile(int id)async{
    final token =await SharedHelper.getToken();
    final response = await _netWork.postData(
      headers: {'Authorization': 'Bearer $token'},
      url: 'showdoctorprofile',
      formData: FormData.fromMap({
        'padiatrician_id': id
      }),
    );
    print(response);
    _doctorProfileModel = DoctorProfileModel.fromJson(response);
    return _doctorProfileModel;
  }

  Future<int> startChat(int docId)async{
    final id = await SharedHelper.getId();
    final formData = FormData.fromMap({
      'sender_id': id,
      'receiver_id': docId,
      'massage': 'Hello'
    });
    final response = await _netWork.postData(url: 'addConversation',formData: formData);
    return response['data'][0]['conversation_id'];
  }

}