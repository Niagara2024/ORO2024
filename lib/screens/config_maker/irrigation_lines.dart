import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:oro_2024/utils/widgets/form%20needs/drop_down_button.dart';
import 'package:provider/provider.dart';

import '../../state_management/config_maker_provider.dart';
import '../../theme/Theme.dart';

class IrrigationLineTable extends StatefulWidget {
  const IrrigationLineTable({super.key});

  @override
  State<IrrigationLineTable> createState() => _IrrigationLineTableState();
}

class _IrrigationLineTableState extends State<IrrigationLineTable> {
  bool listReady = false;
  late LinkedScrollControllerGroup _scrollable1;
  late ScrollController _verticalScroll1;
  late ScrollController _verticalScroll2;
  late LinkedScrollControllerGroup _scrollable2;
  late ScrollController _horizontalScroll1;
  late ScrollController _horizontalScroll2;
  bool selectButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollable1 = LinkedScrollControllerGroup();
    _verticalScroll1 = _scrollable1.addAndGet();
    _verticalScroll2 = _scrollable1.addAndGet();
    _scrollable2 = LinkedScrollControllerGroup();
    _horizontalScroll1 = _scrollable2.addAndGet();
    _horizontalScroll2 = _scrollable2.addAndGet();
  }

  @override
  Widget build(BuildContext context) {
    var configPvd = Provider.of<ConfigMakerProvider>(context, listen: true);

    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      var width = constraints.maxWidth;
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
              SizedBox(width: 10,),
              Row(
                children: [
                  Checkbox(
                      value: selectButton,
                      onChanged: (value){
                        setState(() {
                          selectButton = value!;
                        });
                      }
                  ),
                  Text('Select all')
                ],
              ),
              SizedBox(width: 10,)

            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(bottom: BorderSide(width: 1.0, color: Colors.white), right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                              padding: EdgeInsets.only(top: 8),
                              width: 60,
                              height: 80,
                              child: Column(
                                children: [
                                  Text('Line',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
                                  Text('20',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
                                ],
                              )
                            ),
                          ],
                        ),

                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _verticalScroll1,
                          child: Container(
                            child: Column(
                              children: [
                                for(var i = 0;i < configPvd.irrigationLines.length; i++)
                                  Container(
                                    width: 60,
                                    height: 60,
                                    color: PrimaryColor,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        if(selectButton == true)
                                          Checkbox(
                                              fillColor: MaterialStateProperty.all(Colors.white),
                                              checkColor: PrimaryColor,
                                              value: configPvd.irrigationLines[i]['isSelected'] == 'select' ? true : false,
                                              onChanged: (value){
                                                configPvd.irrigationLinesFunctionality(['selectIrrigationLine',i,value]);
                                              }),
                                        Center(child: Text('${i + 1}',style: TextStyle(fontSize: 12,color: Colors.white))),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 1.0, color: Colors.white)
                            )
                        ),
                        width: MediaQuery.of(context).orientation == Orientation.portrait ? width-20-60 : width-20-60-70,
                        child: SingleChildScrollView(
                          controller: _horizontalScroll1,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 60,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('Valve',style: TextStyle(fontSize: 14,color: Colors.white),),
                                    Text('10',style: TextStyle(fontSize: 14,color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 60,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('Main',style: TextStyle(fontSize: 14,color: Colors.white),),
                                    Text('Valve',style: TextStyle(fontSize: 14,color: Colors.white),),
                                    Text('5',style: TextStyle(fontSize: 14,color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('Central',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('Dosing',style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('Central',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('Filtration',style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('Local',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('Dosing',style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('Local',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('Filtration',style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('Pressure',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('Sensor',style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('Water',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('Source',style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('Water',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('Meter',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('20',style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('RTU',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('3',style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('ORO',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('Switch',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('2',style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                                ),
                                padding: EdgeInsets.only(top: 8),
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Text('ORO',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('Sense',style: TextStyle(fontSize: 14, color: Colors.white),),
                                    Text('2',style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).orientation == Orientation.portrait ? width-20-60 : width-20-60-70,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _horizontalScroll2,
                            child: Container(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                controller: _verticalScroll2,
                                child: Column(
                                  children: [
                                    for(var i = 0;i < configPvd.irrigationLines.length; i++)
                                      Container(
                                        color: i % 2 != 0 ? Colors.blue.shade100 : Colors.blue.shade50,
                                        child: Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(5),
                                                width: 60,
                                              height: 60,
                                                child: Center(
                                                  child: TextFormField(
                                                    initialValue: '${configPvd.irrigationLines[i]['valve']}',
                                                    maxLength: 1,
                                                    onChanged: (value){
                                                      configPvd.irrigationLinesFunctionality(['editValve',i,value]);
                                                    },
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                        counterText: '',
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide.none
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              width: 60,
                                              height: 60,
                                                child: Center(
                                                  child: TextFormField(
                                                    initialValue: '${configPvd.irrigationLines[i]['main_valve']}',
                                                    maxLength: 1,
                                                    onChanged: (value){
                                                      configPvd.irrigationLinesFunctionality(['editMainValve',i,value]);
                                                    },
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                        counterText: '',
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide.none
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5),
                                              width: 80,
                                              height: 60,
                                              child: MyDropDown(initialValue: configPvd.irrigationLines[i]['Central_dosing_site'], itemList: configPvd.central_dosing_site_list , pvdName: 'editCentralDosing', index: i)
                                            ),
                                            Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5),
                                                width: 80,
                                                height: 60,
                                                child: MyDropDown(initialValue: configPvd.irrigationLines[i]['Central_filtration_site'], itemList: configPvd.central_filtration_site_list , pvdName: 'editCentralFiltration', index: i)
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5),
                                              width: 80,
                                              height: 60,
                                              child: Center(
                                                child:  Checkbox(
                                                    value: configPvd.irrigationLines[i]['Local_dosing_site'],
                                                    onChanged: (value){
                                                      configPvd.irrigationLinesFunctionality(['editLocalDosing',i,value]);
                                                    }
                                                ),
                                              ),                                      ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5),
                                              width: 80,
                                              height: 60,
                                              child: Center(
                                                child:  Checkbox(
                                                    value: configPvd.irrigationLines[i]['local_filtration_site'],
                                                    onChanged: (value){
                                                      configPvd.irrigationLinesFunctionality(['editLocalFiltration',i,value]);
                                                    }
                                                ),
                                              ),                                       ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5),
                                              width: 80,
                                              height: 60,
                                              child: Center(
                                                child:  Checkbox(
                                                    value: configPvd.irrigationLines[i]['pressure_sensor'],
                                                    onChanged: (value){
                                                      configPvd.irrigationLinesFunctionality(['editPressureSensor',i,value]);
                                                    }
                                                ),
                                              ),
                                            ),
                                            Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5),
                                                width: 80,
                                                height: 60,
                                                child: MyDropDown(initialValue: configPvd.irrigationLines[i]['water_source'], itemList: configPvd.water_source_list , pvdName: 'editWaterSource', index: i)
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5),
                                              width: 80,
                                              height: 60,
                                              child: Center(
                                                child:  Checkbox(
                                                    value: configPvd.irrigationLines[i]['water_meter'],
                                                    onChanged: (value){
                                                      configPvd.irrigationLinesFunctionality(['editWaterMeter',i,value]);
                                                    }
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5),
                                              width: 80,
                                              height: 60,
                                                child: Center(
                                                  child: TextFormField(
                                                    initialValue: '${configPvd.irrigationLines[i]['RTU']}',
                                                    maxLength: 1,
                                                    onChanged: (value){
                                                      configPvd.irrigationLinesFunctionality(['editRTU',i,value]);
                                                    },
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                        counterText: '',
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide.none
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),
                                            Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5),
                                                width: 80,
                                                height: 60,
                                                child: Center(
                                                  child: TextFormField(
                                                    initialValue: '${configPvd.irrigationLines[i]['ORO_switch']}',
                                                    maxLength: 1,
                                                    onChanged: (value){
                                                      configPvd.irrigationLinesFunctionality(['editOroSwitch',i,value]);
                                                    },
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                        counterText: '',
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide.none
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),
                                            Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5),
                                                width: 80,
                                                height: 60,
                                                child: Center(
                                                  child: TextFormField(
                                                    initialValue: '${configPvd.irrigationLines[i]['ORO_sense']}',
                                                    maxLength: 1,
                                                    onChanged: (value){
                                                      configPvd.irrigationLinesFunctionality(['editOroSense',i,value]);
                                                    },
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                        counterText: '',
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide.none
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),

                                          ],
                                        ),
                                      ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
