import 'package:dio/dio.dart';
import 'package:e7twa2/network/network.dart';

import '../shared_preferences.dart';

class ConfirmAppointmentController {

  NetWork _netWork = NetWork();

  Future<void> confirm(int id)async{
    final token = SharedHelper.getToken();
    await _netWork.postData(
      url: 'confirmappointment',
        headers: {
          "Authorization":
          // "Bearer $token",
          //TODO:
          "Bearer TQPzTToNNw3cq64q6vzdAOt4YWH6ZfpecW2INxHjcd4iXk70hyrBQ64PUismWw8Ij13f7ay7q7rvc8MjrJGlk9GcrA0UE8UKlnXD",
        },
      formData: FormData.fromMap({
        'appointment_id':id
      })
    );
  }

}