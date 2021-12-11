
import 'package:e7twa2/chat/view.dart';
import 'package:flutter/material.dart';


class ChatsCard extends StatelessWidget {
  final String name;
  final String image;
  final String date;
  final int chatId;
  final bool arrow;
   ChatsCard({ this.name, this.image, this.date, this.arrow, this.chatId}) ;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>ChatView(date: date,name: name,chatId: chatId,))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:20),
        padding: EdgeInsets.symmetric(horizontal:10),
        height: height*.12,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: height*.1,
                    child: Image.asset(image)),
                SizedBox(width: 15,),
                Text(name,style: TextStyle(color:Colors.black,fontSize: 16, fontWeight: FontWeight.bold,),),



              ],
            ),
           arrow==false?SizedBox():  Icon(Icons.keyboard_arrow_right
              ,size:30,),
          ],
        ),
      ),
    );
  }
}
