import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:e7twa2/home/view.dart';
import 'package:e7twa2/local_notification.dart';
import 'package:e7twa2/medicineAlarm/controller.dart';
import 'package:e7twa2/vaccinesAlarm/widgets/am_pm_switch.dart';
import 'package:e7twa2/vaccinesAlarm/widgets/small_text_field.dart';
import 'package:e7twa2/widgets/customTextFeild.dart';
import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:e7twa2/widgets/loading.dart';
import 'package:e7twa2/widgets/smallButton.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MedicineAlarmView extends StatefulWidget {
  @override
  _MedicineAlarmViewState createState() => _MedicineAlarmViewState();
}

class _MedicineAlarmViewState extends State<MedicineAlarmView> {
  TextEditingController startDate = TextEditingController(text:  DateTime.now().year.toString() + '-' + DateTime.now().month.toString().padLeft(2,'0') + '-' + DateTime.now().day.toString().padLeft(2,'0'));
  TextEditingController endDate = TextEditingController(text:  DateTime.now().year.toString() + '-' + DateTime.now().month.toString().padLeft(2,'0') + '-' + DateTime.now().day.toString().padLeft(2,'0'));
  TextEditingController time = TextEditingController(text: TimeOfDay.now().hour.toString().padLeft(2,'0') + ':'+TimeOfDay.now().minute.toString().padLeft(2,'0'));
  TextEditingController days = TextEditingController(text: '5');
  TimeOfDay timeOfDay = TimeOfDay.now();
  bool _isLoading = false;
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: GradientBackground(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text('Medicine alarm',style: TextStyle(fontWeight: FontWeight.bold),),
            Image.asset('assets/images/perceptions.png',height: sizeFromHeight(context, 4),),
            CustomTextField(
              hint: 'Start Date',
              read: true,
              hPadding: 0,
              controller: startDate,
              onTap: ()async{
                final picked = await showDatePicker(context: context,
                    initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 7)));
                if(picked != null){
                  setState(() {
                    startDate.text = picked.year.toString() + '-' + picked.month.toString().padLeft(2,'0') + '-' + picked.day.toString().padLeft(2,'0');
                  });
                }
              },
            ),
            CustomTextField(
              hint: 'End Date',
              read: true,
              hPadding: 0,
              controller: endDate,
              onTap: ()async{
                final picked = await showDatePicker(context: context,
                    initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 7)));
                if(picked != null && picked.isAfter(DateTime.parse(startDate.text))){
                  setState(() {
                    endDate.text = picked.year.toString() + '-' + picked.month.toString().padLeft(2,'0') + '-' + picked.day.toString().padLeft(2,'0');
                  });
                }
              },
            ),
            CustomTextField(
              hint: 'Days',
              hPadding: 0,
              type: TextInputType.number,
              controller: days,
            ),
            CustomTextField(
              hPadding: 0,
              read: true,
              onTap: ()async{
                final picked = await showTimePicker(context: context,initialTime: TimeOfDay.now());
                if(picked != null){
                  setState(() {
                    time.text = picked.hour.toString() + ':' + picked.minute.toString().padLeft(2,'0');
                    timeOfDay = picked;
                  });
                }
              },
              hint: 'Time',
              controller: time,
            ),


            SizedBox(height: 20,),
            _isLoading ? Loading() : Row(
              children: [
                Expanded(
                  child: SmallButton(
                    title: 'Cancel',
                    onPressed: ()=> Navigator.pop(context),
                    color: Colors.redAccent,
                  ),
                ),
                Expanded(
                  child: SmallButton(
                    title: 'Add Alarm',
                    onPressed: ()async{
                      print(days.text);
                      print(endDate.text);
                      print(startDate.text);
                      print(time.text);
                      setState(()=> _isLoading = true);
                      int id = await MedicineAlarmController().addAlarm(
                        days: days.text,
                        endDate: endDate.text,
                        startDate: startDate.text,
                        time: time.text,
                      );
                      AndroidAlarmManager.oneShotAt(DateTime.parse(startDate.text).add(Duration(
                        hours: timeOfDay.hour,
                        minutes: timeOfDay.minute,
                      )), id, x);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeView(),),(_)=> false);
                    },
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
          ])
      ),
    );
  }
}

void x()async{
  LocalNotifications.pushNotifications('Medicine', 'It\'s time for your medicine');
}