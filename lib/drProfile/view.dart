import 'package:e7twa2/Bills/view.dart';
import 'package:e7twa2/drProfile/state/state.dart';
import 'package:e7twa2/profile/cubit/cubit.dart';
import 'package:e7twa2/profile/data/controller.dart';
import 'package:e7twa2/profile/data/model.dart';
import 'package:e7twa2/welcome/view.dart';
import 'package:e7twa2/widgets/customButton.dart';
import 'package:e7twa2/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';
import 'cubit/cubit.dart';

class DrProfile extends StatefulWidget {
  @override
  _DrProfileState createState() => _DrProfileState();
}

class _DrProfileState extends State<DrProfile> {
  int value=0;
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
    final cubit = EditDrCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body:Stack(
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
          loading?
          Center(
            child: SpinKitChasingDots(
              size: 40,
              color: kPrimaryColor,
            ),
          ):Padding(
            padding:  EdgeInsets.only(top: height*.1),
            child: ListView(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  child: Text("Your Profile",style: TextStyle(fontSize:24,fontWeight: FontWeight.bold)),
                ),
                Container(
                    height: height*.1,
                    child: Image.asset("assets/images/doc.png",fit: BoxFit.contain,)),

                SizedBox(height: height*.02,),
                CustomTextField(
                  hint:_profileModel.data.padiatricianName,
                  dIcon: "assets/images/doc.png",
                  onsave: (v){
                    cubit.doctorName=v;
                  },
                ),
                CustomTextField(
                  hint: _profileModel.data.userName,
                  dIcon: "assets/images/user.png",
                  onsave: (v){
                    cubit.userName=v;
                  },
                ),
                CustomTextField(
                  hint: _profileModel.data.phone,
                  dIcon: "assets/images/phone.png",
                  onsave: (v){
                    cubit.phone=v;
                  },
                ),
                CustomTextField(
                  hint: _profileModel.data.email,
                  dIcon: "assets/images/email.png",
                  onsave: (v){
                    cubit.email=v;
                  },
                ),
                CustomTextField(
                  hint: _profileModel.data.specialization,
                  dIcon: "assets/images/hed.png",
                  onsave: (v){
                    cubit.specialization=v;
                  },
                ),
                CustomTextField(
                  hint: _profileModel.data.sex,
                  dIcon: "assets/images/doc.png",
                ),
                SizedBox(height: height*.02,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue:value,
                              onChanged: (val){
                                setState(() {
                                  value=val;
                                  cubit.sex = "male";
                                });
                              }),
                         Text("Male"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 2,
                              groupValue:value,
                              onChanged: (val){
                                setState(() {
                                  value=val;
                                  cubit.sex = "female";
                                });
                              }),
                          Text("Female"),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height*.02,),
                BlocConsumer<EditDrCubit,EditDrState>(
                    listener: (_,state){
                      if(state is EditErrorState )
                        Scaffold.of(_).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                          ),)));
                      if(state is EditSuccessState ){
                        _getProfile();
                      }
                    },
                    builder:(_,state){
                      return state is EditLoadingState?
                      Center(
                        child: SpinKitChasingDots(
                          size: 40,
                          color: kPrimaryColor,
                        ),
                      ): CustomButton(onPressed:(){
                        cubit.editDr();
                      }, title: "Update",color: Colors.purpleAccent,);
                    }
                ),
                CustomButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(_)=> WelcomeView()));
                }, title: "Log Out",color: kPrimaryColor,)

              ],

            ),
          ),
        ],
      ),
    );
  }
}
