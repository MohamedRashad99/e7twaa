import 'package:e7twa2/constants.dart';
import 'package:flutter/material.dart';

class VaccinationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Function onTap;
  final bool del;
  VaccinationCard({this.title,this.image,this.subtitle, this.onTap, this.del});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            image == null ?
            Icon(Icons.notifications,color: kRoundColor,size: 30,) :
                Image.asset('assets/images/$image.png',width: 50,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title ?? 'IPV',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                Text(subtitle ?? '20/2/2020',style: TextStyle(fontSize: 12),),
              ],
            ),
            Spacer(),
           del==true?SizedBox(): IconButton(
              icon: Icon(Icons.delete,color: Colors.red,),
              onPressed: onTap,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white54
        ),
      ),
    );
  }
}
