import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  CustomButton({@required this.onPressed,@required this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:5,horizontal:20),
      height: MediaQuery.of(context).size.height /16,
      width: MediaQuery.of(context).size.width / 1.2,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(
              color:Colors.white,
              fontFamily: "dinnextl bold",
              fontSize:18,),),
          ],
        ),
        color: color==null? kPrimaryColor:color,
        onPressed: onPressed,
        elevation: 3,
      ),
    );
  }
}
