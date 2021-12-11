import 'package:e7twa2/DoctorHome/view.dart';
import 'package:e7twa2/DoctorProfile/view.dart';
import 'package:e7twa2/constants.dart';
import 'package:e7twa2/forgetPassword/view.dart';
import 'package:e7twa2/home/view.dart';
import 'package:e7twa2/widgets/customButton.dart';
import 'package:e7twa2/widgets/customTextFeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/cubit.dart';
import 'bloc/state.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState>_globalKey =GlobalKey<FormState>();
  bool select = true;

  void _checkType()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.getString("type")=="padiatrician"?Navigator.push(context, MaterialPageRoute(builder:(_)=>DrHome() ))
          : Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(_)=>HomeView() ),(_)=> false);
  }
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

                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                   child: Text("Welcome!",style: TextStyle(fontSize:24,fontWeight: FontWeight.bold)),
                 ),
                Align(
                   alignment: Alignment.center,
                   child: Stack(
                     children: [
                       GestureDetector(
                         onTap: (){
                           setState(() {
                             select=!select;
                           });
                         },
                         child: Container(
                           padding: EdgeInsets.symmetric(horizontal:30),
                           height:height*.06,
                           width: height*.42,
                           decoration: BoxDecoration(
                               color:  select==true?kAccentColor:Colors.white,
                               borderRadius: BorderRadius.circular(30),
                               border: Border.all(color: Colors.grey,width: 1)
                           ),
                           child: Align(
                             alignment:Alignment.centerRight,
                             child: Text("Doctor",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold)),
                           ),
                         ),
                       ),
                       GestureDetector(
                         onTap: (){
                          setState(() {
                            select=!select;
                          });
                         },
                         child: Container(
                           padding: EdgeInsets.symmetric(horizontal:30),
                           height:height*.06,
                           width: height*.23,
                           decoration: BoxDecoration(
                               color: select!=true?kAccentColor:Colors.white,
                               borderRadius: BorderRadius.circular(30),
                               border: Border.all(color: Colors.grey,width: 1)
                           ),
                           child: Align(
                             alignment:Alignment.center,
                             child: Text("Parent",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold)),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: height*.05,),
                 CustomTextField(
                   valid: (v){
                     if(v.isEmpty){
                       return "Please enter Your Name";
                     }
                   },
                   hint: "usrName",
                   dIcon: "assets/images/user.png",
                   onsave: (v){
                     LoginControllerCubit.get(context).name = v;
                   },
                 ),
                 CustomTextField(
                   valid: (v){
                     if(v.isEmpty){
                       return "Please enter Your Password";
                     }
                   },
                   hint: "password",
                   dIcon: "assets/images/pas.png",
                   icon: Icons.lock_outline,
                   onsave: (v){
                     LoginControllerCubit.get(context).password = v;
                   },
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgetPassword()));
                   },
                   child: Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                     child: Text("Forget password?",textAlign: TextAlign.right,
                         style:
                     TextStyle(fontSize:14,fontWeight: FontWeight.w600,color: Colors.purpleAccent,)),
                   ),
                 ),
                 SizedBox(height: height*.05,),
                 BlocConsumer<LoginControllerCubit,LoginState>(
                   listener: (_,state){
                     if(state is LoginErrorState )
                       Scaffold.of(_).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
                         style: TextStyle(
                             color: Colors.white,
                             fontFamily: "dinnextl bold",
                             fontSize: 14
                         ),)));
                     if(state is LoginSuccessState ){
                      _checkType();
                     }
                   },
                   builder: (context,state){
                     final cubit = LoginControllerCubit.get(context);
                     return Column(
                       children: [
                         state is LoginLoadingState ? Center(
                           child: SpinKitChasingDots(
                             size: 40,
                             color: kPrimaryColor,
                           ),
                         ) :  CustomButton(
                             onPressed: ()  {
                               if(_globalKey.currentState.validate()){
                                 cubit.signIn();
                               }
                             },
                             color: kPrimaryColor,
                             title: "SignIn")
                       ],
                     );

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
