import 'package:e7twa2/medicineAlarm/view.dart';
import 'package:e7twa2/perceptions/controller.dart';
import 'package:e7twa2/perceptions/model.dart';
import 'package:e7twa2/vaccination/controller.dart';
import 'package:e7twa2/vaccination/widgets/card.dart';
import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:e7twa2/widgets/loading.dart';
import 'package:e7twa2/widgets/smallButton.dart';
import 'package:flutter/material.dart';

class PerceptionsView extends StatefulWidget {
  @override
  _PerceptionsViewState createState() => _PerceptionsViewState();
}

class _PerceptionsViewState extends State<PerceptionsView> {
  bool _isLoading = true;
  MyMedicineAlarmsModel _myMedicineAlarmsModel;
  @override
  void initState() {
    getData();
    super.initState();
  }
  getData()async{
    _myMedicineAlarmsModel = await MyMedicinesController().getMedicines();
    setState(()=> _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: GradientBackground(
        padding: EdgeInsets.all(20),
        child: _isLoading ? Loading() : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Medicine',style: TextStyle(
                fontWeight: FontWeight.w900,fontSize: 20
            ),),
            SizedBox(height: 20,),
            Expanded(child: ListView.builder(
              itemCount: _myMedicineAlarmsModel.data.length,
              itemBuilder: (context, index) => VaccinationCard(
                onTap: ()async{
                  setState(()=> _isLoading = true);
                  await MyVaccinesController().delete(id: _myMedicineAlarmsModel.data[index].id,vaccine: false);
                  getData();
                },
                image: 'perceptions',
                title: '${_myMedicineAlarmsModel.data[index].days} Day',
                subtitle: _myMedicineAlarmsModel.data[index].startDate + ' / ' + _myMedicineAlarmsModel.data[index].endDate,
              ),
            )),
            Align(
                alignment: Alignment.centerRight,
                child: SmallButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineAlarmView(),)),
                  title: 'Add Alarm',color: Colors.lightBlueAccent,)
            )
          ],
        ),
      ),
    );
  }
}