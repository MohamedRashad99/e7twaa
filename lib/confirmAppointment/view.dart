import 'package:e7twa2/confirmAppointment/controller.dart';
import 'package:e7twa2/home/view.dart';
import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:e7twa2/widgets/loading.dart';
import 'package:e7twa2/widgets/smallButton.dart';
import 'package:e7twa2/widgets/toast.dart';
import 'package:flutter/material.dart';

class ConfirmAppointmentView extends StatefulWidget {
  final int id;
  final String location;
  final String date;
  final String time;
  final String docName;
  ConfirmAppointmentView(
      {this.id, this.location, this.date, this.time, this.docName});

  @override
  _ConfirmAppointmentViewState createState() => _ConfirmAppointmentViewState();
}

class _ConfirmAppointmentViewState extends State<ConfirmAppointmentView> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,pop: false),
      body: GradientBackground(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildCard(
              text: widget.location,
              image: 'location'
            ),
            _buildCard(
              text: widget.docName,
              image: 'doc',
            ),
            _buildCard(
              text: widget.date,
              image: 'date'
            ),
            _buildCard(
              text: widget.time,
              image: 'time'
            ),
            Align(
              alignment: Alignment.centerRight,
              child: _isLoading ? Loading() : SmallButton(
                title: 'Confirm',
                onPressed: ()async{
                  setState(()=> _isLoading = true);
                  await ConfirmAppointmentController().confirm(widget.id);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeView(),), (route) => false);
                  showToast('Appointment Confirmed Successfully!');
                },
                color: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCard({
  String text,
  String image,
})=> Container(
  margin: EdgeInsets.symmetric(vertical: 10),
  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
  child: Row(
    children: [
      if(image == 'time')
        Icon(Icons.alarm),
      if(image == 'location')
        Icon(Icons.location_on_rounded,color: Colors.red,),
      if(image == 'doc' || image == 'date')
        Image.asset('assets/images/$image.png',width: 25,),
      SizedBox(width: 10,),
      Text(text),
    ],
  ),
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50)
  ),
);
