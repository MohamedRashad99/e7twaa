
import 'package:e7twa2/DrAppoint/view.dart';
import 'package:e7twa2/chat/view.dart';
import 'package:flutter/material.dart';


class DrHomeCard extends StatelessWidget {
  final String name;
  final String image;
  final String date;
  final bool arrow;
  final Widget route;
  DrHomeCard({ this.name, this.image, this.date, this.arrow, this.route}) ;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap:()=>arrow==true? Null:Navigator.push(context, MaterialPageRoute(builder: (_)=>route)),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name,style: TextStyle(color:Colors.black,fontSize: 16, fontWeight: FontWeight.bold,),),
                    date==null?SizedBox():Text(date,style: TextStyle(color:Colors.black,fontSize: 14, fontWeight: FontWeight.w600,),),
                  ],
                ),



              ],
            ),
            arrow==false?SizedBox():  Icon(Icons.edit
              ,size:30,),
          ],
        ),
      ),
    );
  }
}
