import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ff= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Directionality(
            textDirection: TextDirection.rtl,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  ff =!ff;
                });
              },
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 85,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ff==false? Text(" "):Text("مسا مسا يزميلى")

        ],

      ) ,
    );
  }
}
