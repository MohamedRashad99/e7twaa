import 'package:e7twa2/constants.dart';
import 'package:e7twa2/signUp/bloc/cubit.dart';
import 'package:e7twa2/vaCode/bloc/cubit.dart';
import 'package:e7twa2/vaCode/view.dart';
import 'package:e7twa2/widgets/customButton.dart';
import 'package:e7twa2/widgets/customTextFeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'bloc/state.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState>_globalKey =GlobalKey<FormState>();
  int value=0;
  bool select = true;
  String date;
  @override
  Widget build(BuildContext context) {
    final cubit=SignUpControllerCubit.get(context);
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
                Image.asset("assets/images/logo.png"),
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
                    child: Text("Create Your account",style: TextStyle(fontSize:24,fontWeight: FontWeight.bold)),
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
                              child: Text("Dcotor",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold)),
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
                  SizedBox(height: height*.02,),
                  CustomTextField(
                    valid: (v){
                      if(v.isEmpty){
                        return select==true?"please enter Baby Name":"please enter Doctor Name";
                      }
                    },

                    type: TextInputType.name,
                    hint:select==true?"baby Name":"Doctor Name",
                    dIcon: select==true?"assets/images/baby.png":"assets/images/doc.png",
                    onsave: (v){
                      select==true?cubit.babyName=v:cubit.doctorName=v;
                    },
                  ),
                  CustomTextField(
                    valid: (v){
                      if(v.isEmpty){
                        return "please enter your UserName";
                      }
                    },
                    type: TextInputType.text,
                    hint: "usrName",
                    dIcon: "assets/images/user.png",
                    onsave: (v){
                      cubit.parentName=v;
                    },
                  ),
                  CustomTextField(
                    valid: (v){
                      if(v.isEmpty){
                        return "please enter your phone";
                      }
                    },
                    type: TextInputType.number,
                    hint: "phone",
                    dIcon: "assets/images/phone.png",
                    onsave: (v){
                      cubit.phone=v;
                    },
                  ),
                  CustomTextField(
                    valid: (v){
                      if(v.isEmpty){
                        return "please enter your email";
                      }
                    },
                    type: TextInputType.emailAddress,
                    hint: "example@example.com",
                    dIcon: "assets/images/email.png",
                    onsave: (v){
                      cubit.email=v;
                      VaControllerCubit.get(context).email=v;
                    },
                  ),
                  CustomTextField(
                    valid: (v){
                      if(v.isEmpty){
                        return "please enter your password";
                      }
                    },
                    hint: "password",
                    dIcon: "assets/images/pas.png",
                    icon: Icons.lock_outline,
                    onsave: (v){
                      cubit.password=v;
                    },
                  ),
                  select==true? CustomTextField(
                    valid: (v){
                      if(cubit.date==null){
                        return "please enter your baby date";
                      }
                    },
                    read: true,
                    onTap: ()async{
                      final picked = await showDatePicker(context: context,
                          initialDate: DateTime.now(), firstDate: DateTime.utc(2000), lastDate: DateTime.now().add(Duration(days: 7)));
                      if(picked != null){
                        setState(() {
                          print(picked.year.toString()+ '-' + picked.month.toString().padLeft(2,'0') + '-' +
                                  picked.day.toString().padLeft(2,'0'));
                          cubit.date = picked.year.toString()
                              + '-' + picked.month.toString().padLeft(2,'0') + '-' +
                              picked.day.toString().padLeft(2,'0');

                        });
                      }
                    },
                    hint: cubit.date!=null?cubit.date:"date of barth",
                    dIcon: "assets/images/date.png",


                  ):
                  CustomTextField(
                    valid: (v){
                      if(v.isEmpty){
                        return "please enter your spicialization";
                      }
                    },
                     type: TextInputType.text,
                    hint: "spicialization",
                    dIcon: "assets/images/hed.png",
                    onsave: (v){
                      cubit.specialization=v;
                    },

                  ),
                  SizedBox(height: height*.02,),
                 select==true? Padding(
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
                                  cubit.sex = "boy";
                                  });
                                }),
                            Image.asset("assets/images/boy.png")
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
                                    cubit.sex = "girl";
                                  });
                                }),
                            Image.asset("assets/images/baby.png")
                          ],
                        ),
                      ],
                    ),
                  ):Padding(
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
                          Text("Male")
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
                           Text("Female")
                         ],
                       ),
                     ],
                   ),
                 ),

                  SizedBox(height: height*.02,),

                 select==true? BlocConsumer<SignUpControllerCubit,SignUpState>(
                    listener: (_,state){
                      if(state is SignUpErrorState )
                        Scaffold.of(_).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                          ),)));
                      if(state is SignUpSuccessState ){
                        VaControllerCubit.get(context).email=cubit.email;
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>VaCode()));
                      }
                    },
                    builder: (context,state){
                      final cubit = SignUpControllerCubit.get(context);
                      return state is SignUpLoadingState ? Center(
                        child: SpinKitChasingDots(
                          size: 40,
                          color: kPrimaryColor,
                        ),
                      ) :  CustomButton(
                          onPressed: (){
                            if(_globalKey.currentState.validate()&&cubit.sex!= null){
                              cubit.signUp();
                            }else{
                              Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(
                                "please Select baby Type",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),)));
                            }
                           },
                          color: kPrimaryColor,
                          title:  "Sign Up");

                    },
                  ):
                 BlocConsumer<SignUpControllerCubit,SignUpState>(
                   listener: (_,state){
                     if(state is DocErrorState )
                       Scaffold.of(_).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
                         style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 14
                         ),)));
                     if(state is DocSuccessState ){
                       VaControllerCubit.get(context).email=cubit.email;
                       Navigator.push(context, MaterialPageRoute(builder: (_)=>VaCode()));
                     }
                   },
                   builder: (context,state){
                     final cubit = SignUpControllerCubit.get(context);
                     return state is DocLoadingState ? Center(
                       child: SpinKitChasingDots(
                         size: 40,
                         color: kPrimaryColor,
                       ),
                     ) :  CustomButton(
                         onPressed: (){
                          if(_globalKey.currentState.validate()&&cubit.sex!= null){
                           cubit.signUpAsDoctor();
                             }else{
                               Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(
                                 "please Select your sex",
                                 style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 14
                                 ),)));
                             }
                         },
                         color: kPrimaryColor,
                         title:  "Sign Up");

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
