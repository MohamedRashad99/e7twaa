import 'package:e7twa2/DrAppoint/view.dart';
import 'package:e7twa2/allChats/view.dart';
import 'package:e7twa2/drProfile/view.dart';
import 'package:e7twa2/profile/data/controller.dart';
import 'package:e7twa2/profile/data/model.dart';
import 'package:e7twa2/reportsPerceptions/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants.dart';
import 'card.dart';

class DrHome extends StatefulWidget {
  @override
  _DrHomeState createState() => _DrHomeState();
}

class _DrHomeState extends State<DrHome> {
  ProfileController _profileController = ProfileController();
  ProfileModel _profileModel=ProfileModel();
  bool loading = true;
  void _getProfile ()async{
    _profileModel = await _profileController.getDrProfile();
    setState(() {
      loading= false;
    });
  }

  @override
  void initState() {
    _getProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                    child: SizedBox(height:height*.04,child: Image.asset("assets/images/back.png")),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(top:10),
                  child: SizedBox(height:height*.9,child: Image.asset("assets/images/logo.png")),
                ),
                Padding(
                  padding:EdgeInsets.only(top:30),
                  child: SizedBox(height:height*.03,child: Image.asset("assets/images/flag.PNG")),
                ),                 ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: height*.13),
            child: Column(
              children: [
                loading? Center(
                  child: SpinKitChasingDots(
                    size: 40,
                    color: kPrimaryColor,
                  ),
                ):Container(
                  margin: EdgeInsets.symmetric(horizontal: 30,),
                  height: height*.24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kAccentColor
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: height*.1,
                              child: Image.asset("assets/images/doc.png",fit: BoxFit.cover,)),
                          Text(_profileModel.data.userName, style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,)),
                          Text(_profileModel.data.specialization.toString(), style: TextStyle(fontSize:14,fontWeight: FontWeight.w600,)),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (_)=>DrProfile()));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("View Profile>>",
                                  style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.blue))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                DrHomeCard(name: "Appointments Schedule",image: "assets/images/appointments.png",arrow: false,route: DrAppoint(),),
                SizedBox(height: 10,),
                DrHomeCard(name: "Reports And Percepations",image: "assets/images/bbb.png",arrow: false,route: ReportsPerceptionsView(),),
                SizedBox(height: 10,),
                DrHomeCard(name: "Patients Chats",image: "assets/images/chat.png",arrow: false,route: AllChats(
                  doc: true,
                ),),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
