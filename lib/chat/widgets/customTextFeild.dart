import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextInputType type;
  final Function onsave;
  final Function valid;
  final IconData icon;
  final TextEditingController controller;

  CustomTextField({ this.hint, this.onsave,
    this.icon, this.type,  this.valid,  this.controller});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _isHidden = true;
  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: widget.valid,
        controller: widget.controller,
        cursorColor: Colors.orangeAccent,
        obscureText: widget.icon == Icons.lock_outline ? _isHidden : false,
        keyboardType:widget.type,
        onSaved: (widget.onsave),
        style: TextStyle(fontSize: 14,color: Colors.orangeAccent),
        decoration: InputDecoration(
         hintText: widget.hint,
          hintStyle: TextStyle(fontSize: 14,color: Colors.grey,fontFamily: "dinnextl medium"),
          filled: true,
          //prefixText: widget.hint,
          fillColor:Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white,width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width:2),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
