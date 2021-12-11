import 'package:e7twa2/DoctorHome/card.dart';
import 'package:e7twa2/DrAppoint/controller.dart';
import 'package:e7twa2/DrAppoint/model.dart';
import 'package:e7twa2/allChats/chatCard.dart';
import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';


class DrAppoint extends StatefulWidget {
  @override
  _DrAppointState createState() => _DrAppointState();
}

class _DrAppointState extends State<DrAppoint> {
  DrAppointModel _drAppointModel =DrAppointModel();
  DrAppController _drAppController =DrAppController();
  bool loading = true;
  void _getDrApp()async{
    _drAppointModel = await  _drAppController.getDrApp();
    setState(() {
      loading=false;
    });
  }
  @override
  void initState() {
    _getDrApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: GradientBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top:40,left: 20),
              child: Text('Appointments schedule',style: TextStyle(
                  fontWeight: FontWeight.w900,fontSize: 20
              ),),
            ),
            loading?
            Center(
              child: SpinKitChasingDots(
                size: 40,
                color: Colors.blue,
              ),
            ):Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: _drAppointModel.data.length,
                  itemBuilder: (_,index)=>Padding(
                    padding:  EdgeInsets.symmetric(vertical:5,horizontal: 20),
                    child: DrHomeCard(
                      arrow: true,
                      image: "assets/images/baby.png",
                      name: _drAppointModel.data[index].parentBabyName,
                      date: _drAppointModel.data[index].time,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
