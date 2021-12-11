import 'package:e7twa2/DoctorHome/view.dart';
import 'package:e7twa2/constants.dart';
import 'package:e7twa2/home/view.dart';
import 'package:e7twa2/vaCode/bloc/state.dart';
import 'package:e7twa2/widgets/customButton.dart';
import 'package:e7twa2/widgets/customTextFeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/cubit.dart';

class VaCode extends StatefulWidget {
  @override
  _VaCodeState createState() => _VaCodeState();
}

class _VaCodeState extends State<VaCode> {
  void _checkType()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.getString("type")=="padiatrician"?Navigator.push(context, MaterialPageRoute(builder:(_)=>DrHome() ))
        : Navigator.push(context, MaterialPageRoute(builder:(_)=>HomeView() ));
  }
  GlobalKey<FormState>_globalKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                SizedBox(height:height*.9,child: Image.asset("assets/images/logo.png")),
                Padding(
                  padding:EdgeInsets.only(top:30),
                  child: SizedBox(height:height*.03,child: Image.asset("assets/images/flag.PNG")),
                ),                 ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: height*.1),
            child: Form(
              key: _globalKey,
              child: ListView(
                children: [
                  SizedBox(
                      height: height*.3,
                      child: Image.asset("assets/images/code.png")),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20),
                    child: Column(
                      children: [
                        Text("Verification",style: TextStyle(fontSize:24,fontWeight: FontWeight.bold)),
                        SizedBox(height: 10,),
                        Container(
                            width: height*.3,
                            child: Text("Enter the verification code we just send you in you email",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize:16,fontWeight: FontWeight.w600,color:Colors.grey))),
                      ],
                    ),
                  ),
                  CustomTextField(
                    valid: (v){
                      if(v.isEmpty){
                        return "please enter Code";
                      }
                    },
                    hint: "code",
                    dIcon: "assets/images/code.png",
                    onsave: (v){
                      VaControllerCubit.get(context).code=v;
                    },
                  ),
                  SizedBox(height: height*.02,),
                  BlocConsumer<VaControllerCubit,VaState>(
                    listener: (_,state){
                      if(state is VaErrorState )
                        Scaffold.of(_).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "dinnextl bold",
                              fontSize: 14
                          ),)));
                      if(state is VaSuccessState ){
                         _checkType();
                      }
                    },
                    builder: (context,state){
                      final cubit = VaControllerCubit.get(context);
                      return state is VaLoadingState ? Center(
                        child: SpinKitChasingDots(
                          size: 40,
                          color: kPrimaryColor,
                        ),
                      ) :  CustomButton(
                          onPressed: ()  {
                            if(_globalKey.currentState.validate()){
                              cubit.sendVa();
                            }
                          },
                          color: kPrimaryColor,
                          title: "Done");
                      },
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
