import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:e7twa2/constants.dart';
import 'package:e7twa2/home/view.dart';
import 'package:e7twa2/local_notification.dart';
import 'package:e7twa2/vaccination/view.dart';
import 'package:e7twa2/vaccinesAlarm/controller.dart';
import 'package:e7twa2/vaccinesAlarm/widgets/am_pm_switch.dart';
import 'package:e7twa2/widgets/customTextFeild.dart';
import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:e7twa2/widgets/loading.dart';
import 'package:e7twa2/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'widgets/drop_menu.dart';
import 'widgets/small_text_field.dart';

class VaccinesAlarmView extends StatefulWidget {
  @override
  _VaccinesAlarmViewState createState() => _VaccinesAlarmViewState();
}

class _VaccinesAlarmViewState extends State<VaccinesAlarmView> {
  static String vaccineName = 'VaccineName';
  TimeOfDay timeOfDay = TimeOfDay.now();
  TextEditingController name = TextEditingController(text: 'Vaccine Name');
  TextEditingController date = TextEditingController(text:  DateTime.now().year.toString() + '-' + DateTime.now().month.toString().padLeft(2,'0') + '-' + DateTime.now().day.toString().padLeft(2,'0'));
  TextEditingController time = TextEditingController(text: TimeOfDay.now().hour.toString().padLeft(2,'0') + ':'+TimeOfDay.now().minute.toString().padLeft(2,'0'));
  bool isAm = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: GradientBackground(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text('Vaccines alarm',style: TextStyle(fontWeight: FontWeight.bold),),
            Icon(Icons.alarm,color: kRoundColor,size: 150,),
            // DropMenu(
            //  hint: 'Select',
            //   onChanged: (v){},
            //   items: [1,2,3],
            // ),
            // DropMenu(
            //   hint: 'Select',
            //   onChanged: (v){},
            //   items: [1,2,3],
            // ),
            CustomTextField(
              hPadding: 0,
              hint: 'Vaccine Name',
              onsave: (v)=> vaccineName = v,
              controller: name,
            ),
            CustomTextField(
              hPadding: 0,
              read: true,
              onTap: ()async{
                final picked = await showDatePicker(context: context,
                    initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 7)));
                if(picked != null){
                  setState(() {
                    date.text = picked.year.toString() + '-' + picked.month.toString().padLeft(2,'0') + '-' + picked.day.toString().padLeft(2,'0');
                  });
                }
              },
              hint: 'Vaccine Date',
              controller: date,
            ),
            CustomTextField(
              hPadding: 0,
              read: true,
              onTap: ()async{
                final picked = await showTimePicker(context: context,initialTime: TimeOfDay.now());
                if(picked != null){
                  setState(() {
                    time.text = picked.hour.toString() + ':' + picked.minute.toString().padLeft(2,'0');
                  });
                }
              },
              hint: 'Vaccine Time',
              controller: time,
            ),
            SizedBox(height: 15,),
            // Row(
            //   children: [
            //     Expanded(child: SmallTextField(controller: hours,)),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 10),
            //       child: Text(':',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            //     ),
            //     Expanded(child: SmallTextField(
            //       controller: minutes,
            //     )),
            //     SizedBox(width: 20,),
            //     AmPmSwitch(
            //       isAM: isAm,
            //       onChanged: ()=> setState(()=> isAm = !isAm),
            //     ),
            //   ],
            // ),
            SizedBox(height: 20,),
            isLoading ? Loading() : Row(
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
                      setState(()=> isLoading = true);
                      int id = await VaccinesAlarm().addAlarm(name.text, time.text, date.text);
                      AndroidAlarmManager.oneShotAt(DateTime.parse(date.text).add(Duration(
                        hours: timeOfDay.hour,
                        minutes: timeOfDay.minute,
                      )), id,x);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeView(),),(_)=> false);
                    },
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static x(){
    LocalNotifications.pushNotifications('$vaccineName Vaccine', 'It\'s time for $vaccineName vaccine');
  }
}