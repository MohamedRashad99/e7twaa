import 'package:e7twa2/Bills/card.dart';
import 'package:e7twa2/fiendDoctor/chatCard.dart';
import 'package:e7twa2/medicineAlarm/view.dart';
import 'package:e7twa2/userReports/card.dart';
import 'package:e7twa2/vaccination/widgets/card.dart';
import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:e7twa2/widgets/smallButton.dart';
import 'package:flutter/material.dart';

class UserReports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: GradientBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top:40,left: 20),
              child: Text('Reports',style: TextStyle(
                  fontWeight: FontWeight.w900,fontSize: 20
              ),),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_,index)=>ReportsCard()),
            ),
          ],
        ),
      ),
    );
  }
}
