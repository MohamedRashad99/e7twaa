import 'package:flutter/material.dart';
import '../../constants.dart';

class DropMenu extends StatelessWidget {
  final dynamic value;
  final String hint;
  final List<dynamic> items;
  final Function(dynamic) onChanged;
  final bool valuesAreModels;
  final Function onTap;
  DropMenu({this.value, this.hint, this.items, this.onChanged, this.valuesAreModels = false, this.onTap});
  @override
  Widget build(BuildContext context) {
    print(items[0].padiatricianName);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: sizeFromHeight(context, 12),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black26, width: 0.3)),
        child: DropdownButton(
          itemHeight: 50.0,
            underline: Text(''),
            iconEnabledColor: Colors.black,
            hint: Text(
              value == null ? hint : valuesAreModels ? value.userName.toString() : value.toString(),
              style: TextStyle(color: Colors.black,fontSize: 13),
            ),
            isExpanded: true,
            items: items
                .map((e) => DropdownMenuItem(
              child: Text(valuesAreModels ? e.userName : e.toString() ?? 'null'),
              value: e,
            ))
                .toList(),
            onChanged: onChanged),
      ),
    );
  }
}