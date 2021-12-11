import 'dart:io';

import 'package:e7twa2/chat/controller.dart';
import 'package:e7twa2/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'customTextFeild.dart';

TextEditingController _messageController = TextEditingController();

class SendMessage extends StatefulWidget {
  final Function afterSendingMessage;
  final int chatId;
  final int senderId;
  final int receiverId;
  SendMessage({this.afterSendingMessage, this.chatId,this.receiverId, this.senderId});

  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  bool _isLoading = false;
  File image;
  ChatController _chatController = ChatController();
  @override
  void dispose() {
    _isLoading = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.camera_alt,color: Colors.white,),
              onPressed: ()async{
                final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                image = File(pickedFile.path);
                setState(() {
                  _isLoading = true;
                });
                if(image != null)
                await _chatController.sendMessage(
                  file: image,
                  conversationId: widget.chatId,
                  senderId: widget.senderId,
                  receiverId: widget.receiverId,
                );
                setState((){
                  _isLoading = false;
                });
                widget.afterSendingMessage();
              } ,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: kPrimaryColor,
            ),
          ),
          SizedBox(width: 10  ,),
          Expanded(
            child: CustomTextField(
              hint: "message",
              controller: _messageController,
            ),
          ),
          SizedBox(width: 10  ,),
          _isLoading ? CircularProgressIndicator() : Container(
            padding: EdgeInsets.all(13),
            child: InkWell(
              child: Icon(Icons.send,color: Colors.white,),
              onTap: ()async{
                if(_messageController.text != null && _messageController.text.isNotEmpty){
                  setState(()=> _isLoading = true);
                  await _chatController.sendMessage(
                    message: _messageController.text,
                    conversationId: widget.chatId,
                    senderId: widget.senderId,
                    receiverId: widget.receiverId,
                  );
                  widget.afterSendingMessage();
                  setState(()=> _isLoading = false);
                  _messageController.clear();
                }
              },
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
