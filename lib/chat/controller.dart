import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e7twa2/network/network.dart';
import 'package:e7twa2/shared_preferences.dart';
import 'model.dart';


class ChatController {
  ChatModel _chatModel =ChatModel();
  NetWork _netWork = NetWork();
  Future<ChatModel> getMessage(int id) async {
    Map<String, dynamic> _body = {
      "conversation_id": id,
    };
    FormData _formData = FormData.fromMap(_body);
    var response =
    await _netWork.postData(url: 'getConversationById', formData: _formData,);
    print(response);
    if (response !=null) {
      _chatModel = ChatModel.fromJson(response);
    } else {
      _chatModel = ChatModel();
    }
    _chatModel.data = _chatModel.data.reversed.toList();
    return _chatModel;
  }

  Future<void> sendMessage({File file,int senderId,String message,int conversationId,int receiverId})async{
    int id = await SharedHelper.getId();
    FormData _formData = FormData.fromMap({
      "sender_id": id,
      "receiver_id": receiverId,
      "type": message == null ? 1 : 0,
      if(message != null)
        'massage': message,
      if(file != null)
        'file': await MultipartFile.fromFile(file.path),
      'conversation_id': conversationId,
    });
    await _netWork.postData(url: 'addMassage',formData: _formData);
  }
}