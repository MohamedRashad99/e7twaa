import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class AcceptButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  AcceptButton({@required this.onPressed,@required this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:5,horizontal: 10),
      height: MediaQuery.of(context).size.height /15,
      width: MediaQuery.of(context).size.width /2.5,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(
              fontSize: 18,  fontFamily: "dinnextl bold",color: Colors.white),),
          ],
        ),
        color: color,
        onPressed: onPressed,
        elevation: 3,
      ),
    );
  }
}
