
import 'package:e7twa2/chat/view.dart';
import 'package:flutter/material.dart';


class ReportsCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
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
                 child: Image.asset("assets/images/bill.png")),
              SizedBox(width: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Reports #1",style: TextStyle(color:Colors.black,fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 3,),
                  Text("2/12/2021",style: TextStyle(color:Colors.grey,fontSize: 14, fontWeight: FontWeight.bold),),
                  SizedBox(height: 3,),
                  Text("Dr.Omar",style: TextStyle(color:Colors.grey,fontSize: 14, fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.purpleAccent,
            maxRadius: 15,
            child: Icon(Icons.keyboard_arrow_right
              ,size:30,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
