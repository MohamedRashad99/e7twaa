import 'package:e7twa2/DoctorProfile/controller.dart';
import 'package:e7twa2/chat/view.dart';
import 'package:e7twa2/makeAppointment/view.dart';
import 'package:e7twa2/widgets/customButton.dart';
import 'package:e7twa2/widgets/customTextFeild.dart';
import 'package:e7twa2/widgets/loading.dart';
import 'package:e7twa2/widgets/mediaButton.dart';
import 'package:e7twa2/widgets/smallButton.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'model.dart';

class DoctorProfile extends StatefulWidget {
  final String location;
  final String name;
  final String phone;
  final String email;
  final String spa;
  final int id;
   DoctorProfile({this.location, this.phone, this.email, this.spa, this.name, this.id});
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  DoctorProfileController _doctorProfileController = DoctorProfileController();
  DoctorProfileModel _doctorProfileModel;
  bool _isLoading = true;
  getData()async{
    _doctorProfileModel = await _doctorProfileController.getDoctorProfile(widget.id);
    setState(()=> _isLoading = false);
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Stack(
        children: [
          Container(
            height: height*1,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/backG.png",),
                    fit: BoxFit.fill
                )
            ),
          ),
          Container(
            height: height*.12,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding:EdgeInsets.only(top:30),
                    child: SizedBox(height:height*.03,child: Image.asset("assets/images/back.png")),
                  ),
                ),
                Image.asset("assets/images/logo.png"),
                Padding(
                  padding:EdgeInsets.only(top:30),
                  child: SizedBox(height:height*.03,child: Image.asset("assets/images/flag.PNG")),
                ),                 ],
            ),
          ),
          _isLoading ? Loading() : Padding(
            padding:  EdgeInsets.only(top: height*.1),
            child: ListView(
              children: [

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  child: Text("Doctor Profile",style: TextStyle(fontSize:24,fontWeight: FontWeight.bold)),
                ),
                Container(
                    height: height*.1,
                    child: Image.asset("assets/images/doc.png",fit: BoxFit.contain,)),
                Text(_doctorProfileModel.data.userName,textAlign: TextAlign.center,
                    style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),


                SizedBox(height: height*.02,),
                CustomTextField(
                  read: true,
                  hint: 'Saudi Arabia',
                  dIcon: "assets/images/user.png",
                ),
                CustomTextField(
                  read: true,
                  hint: _doctorProfileModel.data.phone,
                  dIcon: "assets/images/phone.png",
                ),
                CustomTextField(
                  read: true,
                  hint: _doctorProfileModel.data.email,
                  dIcon: "assets/images/email.png",
                ),
                CustomTextField(
                  read: true,
                  hint: _doctorProfileModel.data.specialization,
                  dIcon:"assets/images/hed.png",
                ),

                SizedBox(height: height*.02,),

                SizedBox(height: height*.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MediaButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MakeAppointmentView()));
                    }, title: "Appointment",color:Colors.deepPurple,),
                    MediaButton(onPressed: ()async{
                      setState(() {
                        _isLoading = true;
                      });
                      final id = await _doctorProfileController.startChat(_doctorProfileModel.data.id);
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatView(
                        name: _doctorProfileModel.data.padiatricianName,
                        date: _doctorProfileModel.data.createdAt,
                        chatId: id,
                      ),));
                    }, title: "Chat",color:Colors.green),
                  ],
                ),




              ],

            ),
          ),
        ],
      ),
    );
  }
}
