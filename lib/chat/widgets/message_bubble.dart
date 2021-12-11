import 'package:e7twa2/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final String date;
  final String image;
  MessageBubble({this.isMe, this.message, this.date, this.image});
  @override
  Widget build(BuildContext context) {
    final width = 100.0;
    //sizeFromWidth(context, 5);
    return Container(
      margin: EdgeInsets.only(
        left: isMe ? width : 0.0,
        right: !isMe ? width : 0.0,
        bottom: 10,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (image == null) ?  Text(message,
            style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            ),
          ) : Image.network(imagesUrl + image),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(date,style: TextStyle(
              fontWeight: isMe ? FontWeight.w200 : FontWeight.w400,
              color:  Colors.black,
              fontSize: 12,
            ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: isMe ? kPrimaryColor : Colors.white ,
        borderRadius: BorderRadius.circular(8)
      ),
    );
  }
}