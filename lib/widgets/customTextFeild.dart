import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextInputType type;
  final Function onsave;
  final Function valid;
  final IconData icon;
  final String dIcon;
  final bool prefix;
  final bool read;
  final TextEditingController controller;
  final double hPadding;
  final Function(String) onChanged;
  final Function onTap;
  CustomTextField({ this.hint, this.onsave,
    this.icon, this.type,  this.valid,  this.controller, this.read, this.dIcon, this.prefix, this.hPadding = 20, this.onTap, this.onChanged});

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
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.hPadding,vertical:3),
        child: TextFormField(
          validator: widget.valid,
          controller: widget.controller,
          cursorColor: kPrimaryColor,
          obscureText: widget.icon == Icons.lock_outline ? _isHidden : false,
          keyboardType:widget.type,
          onChanged: (widget.onsave),
          onTap:widget.onTap,
          // textAlign: TextAlign.right,
          readOnly:widget.read==true?true:false,
          style: TextStyle(fontSize: 14,color: kPrimaryColor,),
          decoration: InputDecoration(
           hintText: widget.hint,
            hintStyle: TextStyle(fontSize: 14,color: kTextColor,fontFamily: "dinnextl medium"),
            prefixIcon: widget.dIcon != null ? Padding(
              padding: EdgeInsets.symmetric(horizontal:10,vertical:6),
              child: SizedBox(height:25,child: Image.asset(widget.dIcon,)),
            ) : null,
            prefix: widget.prefix==true?Text("+966 "):null,
            prefixStyle:  TextStyle(color:kPrimaryColor,fontWeight: FontWeight.w600,fontSize: 14),
            suffixIcon: widget.icon == Icons.lock_outline
                ? IconButton(
              onPressed: _visibility,
              alignment: Alignment.center,
              icon: _isHidden
                  ? Icon(Icons.visibility_off,color: kTextColor,)
                  : Icon(Icons.visibility,color: kAccentColor,),
            )
                : null,contentPadding: EdgeInsets.symmetric(horizontal: widget.dIcon == null ? 20 : 0),
            filled: true,
            //prefixText: widget.hint,
            fillColor:Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:Colors.white,width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor,width:2),
              borderRadius: BorderRadius.circular(30),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
