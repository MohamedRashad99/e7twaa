import 'package:flutter/material.dart';

import '../../constants.dart';


class HeaderInfo extends StatelessWidget {
  final String date;
  final String image;
  final String name;
  HeaderInfo({this.date, this.image, this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: AppBar().preferredSize.height,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: ()=> Navigator.pop(context),),
          Text(name,softWrap: false,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22),),
          IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.transparent,),onPressed: (){},),
          // Text(date,style: TextStyle(fontSize: 12),),
        ],
      ),
      decoration: BoxDecoration(
          color: kAccentColor,
          borderRadius: BorderRadius.circular(8)
      ),
    );
  }
}
