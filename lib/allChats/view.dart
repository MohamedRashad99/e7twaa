import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:flutter/material.dart';
import 'chatsList.dart';
import 'controller/controller.dart';
import 'model/AllChatsModel.dart';

class AllChats extends StatefulWidget {
  final bool doc;

  const AllChats({Key key, this.doc}) : super(key: key);
  @override
  _AllChatsState createState() => _AllChatsState();
}

class _AllChatsState extends State<AllChats> {
  AllChatsModel _allChatsModel =AllChatsModel();
  AllChatsController _allChatsController =AllChatsController();
  bool loading= true;

  void _getAllChats()async{
    _allChatsModel =await _allChatsController.getAllChats();
    setState(() {
      loading = false;
    });
  }
  @override
  void initState() {
    _getAllChats();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: Container(
        height: double.infinity,
        child: GradientBackground(
          child: loading?
          Center(
            child:CircularProgressIndicator(),
          ): AllChatsList(allChatsModel: _allChatsModel,doc: widget.doc,),
        ),
      ),
    );
  }
}
