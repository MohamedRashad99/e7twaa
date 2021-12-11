import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';


class MediaButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  MediaButton({@required this.onPressed,@required this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:5,),
      height: MediaQuery.of(context).size.height /13,
      width: MediaQuery.of(context).size.width / 2.3,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: color,),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 3,),
            Text(title,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:17,),),
          ],
        ),
        color: Colors.white,
        onPressed: onPressed,
        elevation: 3,
      ),
    );
  }
}
