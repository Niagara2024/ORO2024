import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:oro_2024/screens/product_limit_screen.dart';
import 'package:oro_2024/state_management/device_list_provider.dart';
import 'package:oro_2024/state_management/single_instance_of_mqtt_provider.dart';
import 'package:oro_2024/theme/Theme.dart';
import 'package:oro_2024/utils/widgets/form%20needs/drop_down_button.dart';
import 'package:provider/provider.dart';


class DeviceListScreen extends StatefulWidget {
  const DeviceListScreen({super.key});

  @override
  State<DeviceListScreen> createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  late LinkedScrollControllerGroup _scrollable1;
  late ScrollController _verticalScroll1;
  late ScrollController _verticalScroll2;
  late LinkedScrollControllerGroup _scrollable2;
  late ScrollController _horizontalScroll1;
  late ScrollController _horizontalScroll2;
  List<int> selectedList = [];

  List<String> headingList = ['P.T no', 'Ref no', 'ID','IF type', 'Interval', 'select'];

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

  String givingHeading(int value){
    switch (value) {
      case 0 : {
        return 'SI no';
      }
      case 1 : {
        return 'Device Type';
      }
      case 2 : {
        return 'P.T no';
      }
      case 3 : {
        return 'Ref no';
      }
      case 4 : {
        return 'ID';
      }
      case 5 : {
        return 'IF type';
      }
      case 6 : {
        return 'Interval';
      }
      case 7 : {
        return 'select';
      }
      default : {
        return '';
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _verticalScroll1.dispose();
    _verticalScroll2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceListPvd = Provider.of<DeviceListProvider>(context, listen: true);
    // var mqttPvd = Provider.of<MqttProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Device list'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var width = constraints.maxWidth;
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                    padding: EdgeInsets.all(10),
                    tabs: [
                      Tab(
                        child: Row(
                          children: [
                            Icon(Icons.devices, color: Colors.black,),
                            SizedBox(width: 10.0,),
                            Text('Devices',style: TextStyle(color: Colors.black),)
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Icon(Icons.shopping_bag, color: Colors.black,),
                            SizedBox(width: 10.0,),
                            Text('Product',style: TextStyle(color: Colors.black),)
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      )
                    ]
                ),
                Expanded(
                  child: constraints.maxWidth > 600 ? TabBarView(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue.shade50
                            ),
                            padding: EdgeInsets.only(top: 20,bottom: 30),
                            margin: EdgeInsets.only(left: 30,right: 30,top: 30),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    for(var i = 0; i < 8; i++)
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border(bottom: BorderSide(width: 0.5))
                                          ),
                                          padding: EdgeInsets.only(top: 8),
                                          height: 60,
                                          child: Center(child: Text(givingHeading(i),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                                        ),
                                      ),
                                  ],
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: ListView.builder(
                                        itemCount: deviceListPvd.myAssets.length,
                                        itemBuilder: (BuildContext context, int index){
                                          return Container(
                                            margin: index == deviceListPvd.myAssets.length - 1 ? EdgeInsets.only(bottom: 60) : null,
                                            color: index % 2 != 0 ? Colors.blue.shade100 : null,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: Center(child: Text('${index + 1}',style: TextStyle(fontSize: 12))),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.only(top: 8),
                                                    child: Column(
                                                      children: [
                                                        Text('${deviceListPvd.myAssets[index][1]}',style: TextStyle(fontSize: 14),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.only(top: 8),
                                                    child: Column(
                                                      children: [
                                                        Text('${deviceListPvd.myAssets[index][2]}',style: TextStyle(fontSize: 14),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.only(top: 8),
                                                    child: Column(
                                                      children: [
                                                        Text('${deviceListPvd.myAssets[index][3]}',style: TextStyle(fontSize: 14),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.only(top: 8),
                                                    child: Column(
                                                      children: [
                                                        Text('${deviceListPvd.myAssets[index][4]}',style: TextStyle(fontSize: 14),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.only(top: 8),
                                                    height: 60,
                                                    child: MyDropDown(initialValue: deviceListPvd.myAssets[index][5], itemList: ['RF', 'MQTT', 'HTTPS', 'LORA', 'SQTT'], pvdName: 'selectedIF', index: index,),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.only(top: 8),
                                                    height: 60,
                                                    child: MyDropDown(initialValue: deviceListPvd.myAssets[index][6], itemList: ['5 sec', '10 sec', '15 sec', '20 sec', '30 sec'], pvdName: 'selectedInterval', index: index,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                        ProductLimitScreen(),

                      ]
                  ) : TabBarView(
                      children: [
                        Container(
                          color: Colors.blue.shade50,
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 8),
                                          width: 40,
                                          height: 60,
                                          child: Column(
                                            children: [
                                              Text('SI',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
                                              Text('no',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 8),
                                          width: 60,
                                          height: 60,
                                          child: Column(
                                            children: [
                                              Text('Device',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)),
                                              Text('Type',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: PrimaryColor,
                                      border: Border(bottom: BorderSide(width: 1.0, color: Colors.black))
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      controller: _verticalScroll1,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            for(var i = 0;i < deviceListPvd.myAssets.length; i++)
                                              Container(
                                                margin: i == deviceListPvd.myAssets.length - 1 ? EdgeInsets.only(bottom: 60) : null,
                                                color: PrimaryColor,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 60,
                                                      child: Center(child: Text('${i + 1}',style: TextStyle(fontSize: 12,color: Colors.white))),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.centerLeft,
                                                      width: 60,
                                                      height: 60,
                                                      child: Text('${deviceListPvd.myAssets[i][1]}',style: TextStyle(fontSize: 12,color: Colors.white)),
                                                    ),
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
                                        bottom: BorderSide(width: 1.0, color: Colors.black)
                                      )
                                    ),
                                    width: width-20-40-60,
                                    child: SingleChildScrollView(
                                      controller: _horizontalScroll1,
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 8),
                                            width: 40,
                                            height: 60,
                                            child: Column(
                                              children: [
                                                Text('P.T',style: TextStyle(fontSize: 14),),
                                                Text('no',style: TextStyle(fontSize: 14),),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 8),
                                            width: 40,
                                            height: 60,
                                            child: Column(
                                              children: [
                                                Text('Ref',style: TextStyle(fontSize: 14),),
                                                Text('no',style: TextStyle(fontSize: 14),),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 8),
                                            width: 80,
                                            height: 60,
                                            child: Column(
                                              children: [
                                                Text('ID',style: TextStyle(fontSize: 14),),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 8),
                                            width: 80,
                                            height: 60,
                                            child: Column(
                                              children: [
                                                Text('Interface',style: TextStyle(fontSize: 14),),
                                                Text('type',style: TextStyle(fontSize: 14),),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 8),
                                            width: 80,
                                            height: 60,
                                            child: Column(
                                              children: [
                                                Text('Interval',style: TextStyle(fontSize: 14),),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: width-20-40-60,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        controller: _horizontalScroll2,
                                        child: Container(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            controller: _verticalScroll2,
                                            child: Column(
                                              children: [
                                                for(var i = 0;i < deviceListPvd.myAssets.length; i++)
                                                  Container(
                                                    margin: i == deviceListPvd.myAssets.length - 1 ? EdgeInsets.only(bottom: 60) : null,
                                                    color: i % 2 != 0 ? Colors.blue.shade100 : null,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 40,
                                                          height: 60,
                                                          child: Center(child: Text('${deviceListPvd.myAssets[i][2]}',style: TextStyle(fontSize: 12))),
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          height: 60,
                                                          child: Center(child: Text('${deviceListPvd.myAssets[i][3]}',style: TextStyle(fontSize: 12))),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                                          width: 80,
                                                          height: 60,
                                                          child: Column(
                                                            children: [
                                                              Text('${deviceListPvd.myAssets[i][4]}',style: TextStyle(fontSize: 12),),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                                          width: 80,
                                                          height: 60,
                                                          child:  MyDropDown(initialValue: deviceListPvd.myAssets[i][5], itemList: ['RF', 'MQTT', 'HTTPS', 'LORA', 'SQTT'], pvdName: 'selectedIF', index: i,),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                                          width: 80,
                                                          height: 60,
                                                          child:  MyDropDown(initialValue: deviceListPvd.myAssets[i][6], itemList: ['5 sec', '10 sec', '15 sec', '20 sec', '30 sec'], pvdName: 'selectedInterval', index: i,),
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
                        ProductLimitScreen(),
                      ]
                  ),
                )
              ],
            ),

          );


        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          String formatedData = '';
          for(var i = 0;i < deviceListPvd.myAssets.length;i ++){
            for(var j = 0; j < deviceListPvd.myAssets[i].length; j++){
              formatedData += '${deviceListPvd.myAssets[i][j]}';
              if(j < deviceListPvd.myAssets[i].length - 1){
                formatedData += ',';
              }
            }
            formatedData += ';';
          }
          var data = jsonEncode({'device_list' : '${formatedData}'});
          final builder = MqttClientPayloadBuilder();
          builder.addString(data);
          // mqttPvd.mqttClient.clientWeb.publishMessage('oro_gem_device_list', MqttQos.exactlyOnce, builder.payload!);
          },
        child: const Icon(Icons.send),
      ),
    );
  }
}
