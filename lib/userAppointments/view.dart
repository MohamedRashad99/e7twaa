import 'package:e7twa2/DoctorProfile/view.dart';
import 'package:e7twa2/drProfile/view.dart';
import 'package:e7twa2/makeAppointment/view.dart';
import 'package:e7twa2/userAppointments/controller.dart';
import 'package:e7twa2/userAppointments/model.dart';
import 'package:e7twa2/vaccination/widgets/card.dart';
import 'package:e7twa2/vaccinesAlarm/view.dart';
import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:e7twa2/widgets/loading.dart';
import 'package:e7twa2/widgets/smallButton.dart';
import 'package:flutter/material.dart';

class UserAppointmentsView extends StatefulWidget {
  @override
  _UserAppointmentsViewState createState() => _UserAppointmentsViewState();
}

class _UserAppointmentsViewState extends State<UserAppointmentsView> {
  bool _isLoading = true;
  UserAppointmentsModel _userAppointmentsModel;
  getData()async{
    _userAppointmentsModel = await UserAppointmentsController().getMyAppointments();
    setState(()=> _isLoading = false);
  }
  @override
  void initState() {
    getData();
    super.initState();
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
            Text('Your appointments',style: TextStyle(
                fontWeight: FontWeight.w900,fontSize: 20
            ),),
            SizedBox(height: 20,),
            Expanded(child: ListView.builder(
              itemCount: _userAppointmentsModel.data.length,
              itemBuilder: (context, index) => VaccinationCard(
                image: 'doc',
                title: _userAppointmentsModel.data[index].padiatricianUserName,
                subtitle: _userAppointmentsModel.data[index].date,
                del: true,
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorProfile(
                  id: _userAppointmentsModel.data[index].padiatricianId,
                ),)),
              ),)),
            Align(
                alignment: Alignment.centerRight,
                child: SmallButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => MakeAppointmentView(),)), title: 'Create',color: Colors.lightBlueAccent,)
            )
          ],
        ),
      ),
    );
  }
}
