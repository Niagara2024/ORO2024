import 'package:flutter/material.dart';

import '../theme.dart';

class MyDropDown extends StatefulWidget {
  String initialValue;
  List<String> itemList;

  MyDropDown({super.key, required this.initialValue, required this.itemList});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: liteBlue, borderRadius: BorderRadius.circular(10)),
      child: DropdownButton(
        underline: Container(),
        // Initial Value
        value: widget.initialValue,
        isExpanded: true,
        // Down Arrow Icon
        icon: Padding(
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.keyboard_arrow_down),
        ),
        // Array list of items
        items: widget.itemList.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Container(
                padding: EdgeInsets.only(left: 10), child: Text(items)),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            widget.initialValue = newValue!;
          });
        },
      ),
    );
  }
}
