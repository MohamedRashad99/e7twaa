import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

appBar(context,{pop = true}){
  final height = MediaQuery.of(context).size.height;
  return PreferredSize(child: Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: pop ? (){
            Navigator.pop(context);
          } : null,
          child: Padding(
            padding:EdgeInsets.only(top:30),
            child: SizedBox(height:height*.04,child: pop ? Image.asset("assets/images/back.png") : Text('')),
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
  ), preferredSize: Size.fromHeight(height*.12));
}