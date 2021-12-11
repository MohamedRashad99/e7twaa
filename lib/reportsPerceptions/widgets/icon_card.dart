import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final String image;
  final String title;

  const IconCard({Key key, this.image, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 180,
        width: 150,
        margin: EdgeInsets.symmetric(vertical: 50),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(
             height:100,
               child: Image.asset(image)),
            SizedBox(height: 10,),
            Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white60
        ),
      ),
      onTap: (){},
    );
  }
}
