import 'package:e7twa2/fiendDoctor/data/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chatCard.dart';

class AllChatsList extends StatelessWidget {
  final DoctorModel doctorModel;

   AllChatsList({ this.doctorModel});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
        itemBuilder:(ctx,index)=>
            ChatsCard(
          name: doctorModel.data[index].userName,
          image:"assets/images/doc.png",
              phone: doctorModel.data[index].phone,
              email: doctorModel.data[index].email,
              id: doctorModel.data[index].id,
              location:"Riyadh",
              spa: doctorModel.data[index].specialization,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        separatorBuilder: (ctx,ind)=>SizedBox(height:10,),
        itemCount:doctorModel.data.length,
      ),
    );
  }
}
