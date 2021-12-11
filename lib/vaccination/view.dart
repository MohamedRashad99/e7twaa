import 'package:e7twa2/vaccination/controller.dart';
import 'package:e7twa2/vaccination/widgets/card.dart';
import 'package:e7twa2/vaccinesAlarm/view.dart';
import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:e7twa2/widgets/loading.dart';
import 'package:e7twa2/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class VaccinationView extends StatefulWidget {
  @override
  _VaccinationViewState createState() => _VaccinationViewState();
}

class _VaccinationViewState extends State<VaccinationView> {
  bool _isLoading = true;
  MyVaccineAlarmsModel _myVaccineAlarmsModel;
  MyVaccinesController myVaccinesController = MyVaccinesController();
  @override
  void initState() {
    getData();
    super.initState();
  }
  getData()async{
    _myVaccineAlarmsModel = await myVaccinesController.getVaccines();
    setState(()=> _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: GradientBackground(
        child: _isLoading ? Loading() : Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Vaccination',style: TextStyle(
                fontWeight: FontWeight.w900,fontSize: 20
              ),),
              SizedBox(height: 20,),
              Expanded(child: ListView.builder(
                itemCount: _myVaccineAlarmsModel.data.length,
                itemBuilder: (context, index) => VaccinationCard(
                  onTap: ()async{
                    setState(()=> _isLoading = true);
                    await myVaccinesController.delete(id: _myVaccineAlarmsModel.data[index].id);
                    getData();
                  },
                image: 'vaccinations',
                title: _myVaccineAlarmsModel.data[index].vaccine,
                subtitle: _myVaccineAlarmsModel.data[index].date + ' / ' + _myVaccineAlarmsModel.data[index].time,
              ),)),
              Align(
                alignment: Alignment.centerRight,
                child: SmallButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => VaccinesAlarmView(),)), title: 'Add Alarm',color: Colors.lightBlueAccent,)
              )
            ],
          ),
        ),
      ),
    );
  }
}