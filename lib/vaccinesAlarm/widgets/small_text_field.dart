import 'package:flutter/material.dart';

class SmallTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isMinutes;
  SmallTextField({this.controller, this.isMinutes = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: 2,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      validator: (v){
        if(v.isEmpty) return 'Empty';
        else if(int.parse(v) < 0 || (isMinutes ? int.parse(v) > 60 : int.parse(v) > 24)) return 'Invalid';
        return null;
      },
      buildCounter: (context, {currentLength, isFocused, maxLength}) => null,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
    );
  }
}
