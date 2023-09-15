import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state_management/config_maker_provider.dart';
import '../../../state_management/device_list_provider.dart';
import '../../my_theme.dart';

class MyDropDown extends StatefulWidget {
  int index;
  String initialValue;
  String pvdName;
  List<String> itemList;

  MyDropDown({super.key,
    required this.initialValue,
    required this.itemList,
    required this.pvdName,
    required this.index,
  });

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  @override


  @override
  Widget build(BuildContext context) {
    var deviceListPvd = Provider.of<DeviceListProvider>(context, listen: true);
    var configPvd = Provider.of<ConfigMakerProvider>(context, listen: true);
    return Container(
      width: double.infinity,
      child: Center(
        child: DropdownButton(
          value: widget.initialValue,
          underline: Container(),
          // Down Arrow Icon
          // icon: const Icon(Icons.keyboard_arrow_down, size: 20,),
          // Array list of items
          items: widget.itemList.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Container(
                  child: Text(items,style: TextStyle(fontSize: 12),)
              ),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            if(widget.pvdName == 'selectedController'){
              deviceListPvd.editSelectedController(newValue!);
            }else if(widget.pvdName == 'selectedIF'){
              deviceListPvd.editInterface(widget.index, newValue!);
            }
            else if(widget.pvdName == 'selectedInterval'){
              deviceListPvd.editInterval(widget.index, newValue!);
            }else if(widget.pvdName == 'editWaterSource_sp'){
              configPvd.sourcePumpFunctionality(['editWaterSource_sp',widget.index,newValue!]);
            }else if(widget.pvdName == 'editCentralDosing'){
              configPvd.irrigationLinesFunctionality(['editCentralDosing',widget.index,newValue!]);
            }else if(widget.pvdName == 'editCentralFiltration'){
              configPvd.irrigationLinesFunctionality(['editCentralFiltration',widget.index,newValue!]);
            }else if(widget.pvdName == 'editWaterSource'){
              configPvd.irrigationLinesFunctionality(['editWaterSource',widget.index,newValue!]);
            }

          },
        ),
      ),
    );
  }
}
