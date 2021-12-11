import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List images =[
      "assets/images/bs.PNG",
      "assets/images/BF.png",
      "assets/images/Bath.png",
      "assets/images/sleep.PNG",
    ];
    List names =[
      "Development",
      "BrestFeeding",
      "Hygiene",
      "sleeping"
    ];
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
        appBar: appBar(context),
    body: GradientBackground(
      child:Padding(
        padding:  EdgeInsets.symmetric(vertical: 20,horizontal:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5,vertical: 20),
              child: Text('Articles',style: TextStyle(
                  fontWeight: FontWeight.w900,fontSize: 20
              ),),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing:20,
                      crossAxisSpacing:20,
                      childAspectRatio: 1.5/1.7
                  ),
                  itemBuilder:(ctx,index)=> Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                    height: height*.1,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Text(names[index],style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                  itemCount: 4),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
