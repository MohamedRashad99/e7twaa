import 'package:e7twa2/DoctorProfile/view.dart';
import 'package:e7twa2/constants.dart';
import 'package:flutter/material.dart';


class ChatsCard extends StatelessWidget {
  final String name;
  final String image;
  final String location;
  final String phone;
  final String email;
  final int id;
  final String spa;
   ChatsCard({ this.name, this.image, this.location, this.phone, this.email, this.spa, this.id}) ;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>DoctorProfile(
        spa: spa,
        phone: phone,
        name: name,
        email: email,
        id: id,
        location: location,
      ))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: height*.12,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white54
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images/doc.png"),
                SizedBox(width: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name,style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 3,),
                    Text("Riyadh",style: TextStyle(color:Colors.grey,fontSize: 14,fontWeight: FontWeight.w600),),
                  ],
                ),

              ],
            ),
            CircleAvatar(
              backgroundColor: kPrimaryColor,
              maxRadius: 15,
              child: Icon(Icons.keyboard_arrow_right,
                color: Colors.white
                ,size:30,),
            ),
          ],
        ),
      ),
    );
  }
}
