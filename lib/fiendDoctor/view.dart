import 'package:e7twa2/fiendDoctor/data/controller.dart';
import 'package:e7twa2/fiendDoctor/data/model.dart';
import 'package:e7twa2/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants.dart';
import 'chatsList.dart';

class FiendDoctor extends StatefulWidget {
  @override
  _FiendDoctorState createState() => _FiendDoctorState();
}

class _FiendDoctorState extends State<FiendDoctor> {
  DoctorModel _doctorModel = DoctorModel();
  DoctorModel _search = DoctorModel();
  AllDocController _allDocController = AllDocController();
  bool loading = true;

  void _getAllDoc() async {
    _search = await _allDocController.getAllDoc();
    setState(() {
      loading = false;
      _doctorModel.data = [..._search.data];
    });
  }

  @override
  void initState() {
    _getAllDoc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: height * 1,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/backG.png",
                    ),
                    fit: BoxFit.fill)),
          ),
          Container(
            height: height * .12,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: SizedBox(
                        height: height * .03,
                        child: Image.asset("assets/images/back.png")),
                  ),
                ),
                Image.asset("assets/images/logo.png"),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: SizedBox(
                      height: height * .03,
                      child: Image.asset("assets/images/flag.PNG")),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .13),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Find Doctor",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold))),
                ),
                CustomTextField(
                  onsave: (value) {
                    value = value.toLowerCase();
                    if (value.isNotEmpty) {
                      setState(() {
                        _doctorModel.data = [
                          ..._search.data.where((ele) {
                            var all = ele.userName.toLowerCase();
                            return all.contains(value);
                          }).toList()
                        ];
                      });
                    } else {
                      _doctorModel.data = [..._search.data];
                    }
                  },
                  hint: "search",
                  dIcon: "assets/images/doc.png",
                ),
                Expanded(
                    child: loading
                        ? Center(
                            child: SpinKitChasingDots(
                              size: 40,
                              color: kPrimaryColor,
                            ),
                          )
                        : AllChatsList(
                            doctorModel: _doctorModel,
                          )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
