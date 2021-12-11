import 'package:e7twa2/reportsPerceptions/widgets/icon_card.dart';
import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:flutter/material.dart';

class ReportsPerceptionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: GradientBackground(
        padding: EdgeInsets.all(20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reports',style: TextStyle(
                fontWeight: FontWeight.w900,fontSize: 20
            ),),
            SizedBox(height: 20,),
            TextField(
              onChanged: (v){},
              decoration: InputDecoration(
                hintText: 'Search by patient Id',
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.search)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconCard(
                  image: "assets/images/reports.png",
                  title:"View Reports" ,
                ),
                IconCard(
                  image: "assets/images/perceptions.png",
                  title:"View Parceptions" ,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}