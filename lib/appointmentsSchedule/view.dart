import 'package:e7twa2/vaccination/widgets/card.dart';
import 'package:e7twa2/widgets/custom_app_bar.dart';
import 'package:e7twa2/widgets/gradient_bg.dart';
import 'package:flutter/material.dart';

class AppointmentsScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: GradientBackground(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 7)),
                onDateChanged: (v) {print(v);},
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) => VaccinationCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
