import 'dart:async';
import 'package:e7twa2/chat/controller.dart';
import 'package:e7twa2/shared_preferences.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'widgets/header_info.dart';
import 'widgets/message_bubble.dart';
import 'widgets/send_message.dart';

class ChatView extends StatefulWidget {
  final String date;
  final String name;
  final int chatId;
  ChatView({this.name,this.date, this.chatId});
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  ChatModel _chatModel;
  bool _isLoading = true;
  Timer timer;

  @override
  void initState() {
    getMessages(loading: true);
    // timer = Timer.periodic(Duration(minutes:50000000), (timer)=> getMessages());
    super.initState();
  }
  int id = 0;
  Future<void> getMessages({bool loading = false})async{
    id = await SharedHelper.getId();
    _chatModel = await ChatController().getMessage(widget.chatId);
    if(loading)
      _isLoading = false;
    rebuild();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: _isLoading ? Center(child: CircularProgressIndicator(),) : Column(
          children: [
            HeaderInfo(
              name: widget.name,
              image: "",
              date: widget.date,
              // date: widget.messageModel.dateAdded,
              // image: widget.messageModel.profileImage,
              // name: widget.messageModel.author,
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.all(10),
                itemCount: _chatModel.data.length,
                itemBuilder: (_,index){
                  return MessageBubble(
                    image: _chatModel.data[index].type == 1 ? _chatModel.data[index].file : null,
                    message:_chatModel.data[index].massage,
                    date: _chatModel.data[index].createdAt,
                    isMe:_chatModel.data[index].senderId == id,
                  );
                },
              ),
            ),
            SendMessage(
              chatId: _chatModel.data[0].conversationId,
              receiverId: _chatModel.data[0].receiverId,
              senderId: _chatModel.data[0].senderId,
              afterSendingMessage: ()=> getMessages(),
            ),
          ],
        ),
      ),
    );
  }
  void rebuild()async=> this.mounted ? setState((){}) : null;
}