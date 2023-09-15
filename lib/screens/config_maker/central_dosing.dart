import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state_management/config_maker_provider.dart';
import '../../theme/Theme.dart';
import '../../utils/widgets/form needs/drop_down_button.dart';

class CentralDosingTable extends StatefulWidget {
  const CentralDosingTable({super.key});

  @override
  State<CentralDosingTable> createState() => _CentralDosingTableState();
}

class _CentralDosingTableState extends State<CentralDosingTable> {
  bool selectButton = false;
  @override
  Widget build(BuildContext context) {
    var configPvd = Provider.of<ConfigMakerProvider>(context, listen: true);
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint){
      var width = constraint.maxWidth;
      return Container(
        margin: MediaQuery.of(context).orientation == Orientation.portrait ? null : EdgeInsets.only(right: 70),
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
                      Text('Total C.dosing : '),
                      Text('${configPvd.totalCentralDosing}')
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
                          Text('#',style: TextStyle(color: Colors.white),),
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
                          Text('Injector',style: TextStyle(color: Colors.white),),
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
                          Text('Dosing',style: TextStyle(color: Colors.white),),
                          Text('Meter',style: TextStyle(color: Colors.white)),
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
                          Text('Booster',style: TextStyle(color: Colors.white),),
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
                  itemCount: configPvd.centralDosing.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      decoration: BoxDecoration(
                          color: PrimaryColor,
                        border: Border(bottom: BorderSide(width: 0.5,color: Colors.white))
                      ),
                      margin: index == configPvd.centralDosing.length - 1 ? EdgeInsets.only(bottom: 60) : null,

                      width: width-20,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if(selectButton == true)
                                      Checkbox(
                                        fillColor: MaterialStateProperty.all(Colors.white),
                                          checkColor: PrimaryColor,
                                          value: configPvd.centralDosing[index][configPvd.centralDosing[index].length - 1][0] == 'select' ? true : false,
                                          onChanged: (value){
                                            configPvd.centralDosingFunctionality(['selectCentralDosing',index]);
                                          }),
                                    Text('${index + 1}',style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                color: index % 2 != 0 ? Colors.blue.shade100 : Colors.blue.shade50,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    for(var i = 0; i< configPvd.centralDosing[index].length - 1;i ++)
                                      Container(
                                        decoration: i != configPvd.centralDosing[index].length - 2 ? BoxDecoration(
                                            border: Border(bottom: BorderSide(width: 0.5))
                                        ) : null,
                                          child: Center(child: Text('${configPvd.centralDosing[index][i][0]}')),
                                        height: 60,
                                      )
                                  ],
                                )
                            ),
                          ),
                          Expanded(
                            child: Container(
                                color: index % 2 != 0 ? Colors.blue.shade100 : Colors.blue.shade50,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    for(var i = 0; i< configPvd.centralDosing[index].length - 1;i ++)
                                      Container(
                                        decoration: i != configPvd.centralDosing[index].length - 2 ? BoxDecoration(
                                            border: Border(bottom: BorderSide(width: 0.5))
                                        ) : null,
                                        height: 60,
                                        child: Checkbox(
                                            value: configPvd.centralDosing[index][i][1],
                                            onChanged: (value){
                                              configPvd.centralDosingFunctionality(['editDosingMeter',index,i,value]);
                                            }),
                                      ),
                                  ],
                                )
                            ),
                          ),
                          Expanded(
                            child: Container(
                                color: index % 2 != 0 ? Colors.blue.shade100 : Colors.blue.shade50,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    for(var i = 0; i< configPvd.centralDosing[index].length - 1;i ++)
                                      Container(
                                        decoration: i != configPvd.centralDosing[index].length - 2 ? BoxDecoration(
                                            border: Border(bottom: BorderSide(width: 0.5))
                                        ) : null,
                                        height: 60,
                                        child: Checkbox(
                                            value: configPvd.centralDosing[index][i][2],
                                            onChanged: (value){
                                              configPvd.centralDosingFunctionality(['editBooster',index,i,value]);
                                            }),
                                      ),
                                  ],
                                )
                            ),
                          ),
                          // Expanded(
                          //   child: Container(
                          //     width: double.infinity,
                          //     height: 60,
                          //     child: Center(
                          //       child:  Checkbox(
                          //           value: configPvd.sourcePump[index][1],
                          //           onChanged: (value){
                          //             configPvd.editWaterMeter(value!, index);
                          //           }
                          //       ),
                          //     ),
                          //   ),
                          // ),

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
