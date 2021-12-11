import 'package:e7twa2/constants.dart';
import 'package:e7twa2/signIn/view.dart';
import 'package:e7twa2/signUp/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal:30),
                        height:height*.065,
                        width: height*.35,
                        decoration: BoxDecoration(
                            color:kAccentColor,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Align(
                          alignment:Alignment.centerRight,
                          child: Text("Sign Up",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>SignIn()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal:30),
                        height:height*.065,
                        width: height*.2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Align(
                          alignment:Alignment.center,
                          child: Text("Sign In",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ],
      )
    );
  }
}
