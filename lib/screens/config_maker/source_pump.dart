import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:oro_2024/utils/widgets/form%20needs/drop_down_button.dart';
import 'package:provider/provider.dart';

import '../../state_management/config_maker_provider.dart';
import '../../theme/Theme.dart';

class SourcePumpTable extends StatefulWidget {
  const SourcePumpTable({super.key});

  @override
  State<SourcePumpTable> createState() => _SourcePumpTableState();
}

class _SourcePumpTableState extends State<SourcePumpTable> {
  bool selectButton = false;
  @override
  Widget build(BuildContext context) {
    var configPvd = Provider.of<ConfigMakerProvider>(context, listen: true);
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint){
      var width = constraint.maxWidth;
      return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                          value: selectButton,
                          onChanged: (value){
                            setState(() {
                              selectButton = value!;
                            });
                          }
                      ),
                      Text('Select')
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text('Total Source Pump : '),
                      Text('${configPvd.totalSourcePump}')
                    ],
                  ),
                ),
                SizedBox(width: 10,)

              ],
            ),
            Container(
              width: width-20,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Source',style: TextStyle(color: Colors.white),),
                          Text('Pump',style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: PrimaryColor
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Water',style: TextStyle(color: Colors.white),),
                          Text('Source',style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: PrimaryColor
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Water',style: TextStyle(color: Colors.white),),
                          Text('Meter',style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: PrimaryColor
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: configPvd.sourcePump.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: index == configPvd.sourcePump.length - 1 ? EdgeInsets.only(bottom: 60) : null,
                      color: index % 2 != 0 ? Colors.blue.shade100 : Colors.blue.shade50,
                      width: width-20,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if(selectButton == true)
                                      Checkbox(
                                          value: configPvd.sourcePump[index][2] == 'select' ? true : false,
                                          onChanged: (value){
                                            configPvd.selectSourcePump(index);
                                          }),
                                    Text('${index + 1}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              child: MyDropDown(initialValue: configPvd.sourcePump[index][0], itemList: configPvd.waterSource, pvdName: 'editWaterSource_sp', index: index)
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              child: Center(
                                child:  Checkbox(
                                    value: configPvd.sourcePump[index][1],
                                    onChanged: (value){
                                      configPvd.editWaterMeter(value!, index);
                                    }
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
