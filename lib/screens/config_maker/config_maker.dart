import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oro_2024/screens/config_maker/central_dosing.dart';
import 'package:oro_2024/screens/config_maker/central_filtration.dart';
import 'package:oro_2024/screens/config_maker/irrigation_lines.dart';
import 'package:oro_2024/screens/config_maker/irrigation_pump.dart';
import 'package:oro_2024/screens/config_maker/local_dosing.dart';
import 'package:oro_2024/screens/config_maker/local_filtration.dart';
import 'package:oro_2024/screens/config_maker/source_pump.dart';
import 'package:oro_2024/state_management/config_maker_provider.dart';
import 'package:oro_2024/theme/Theme.dart';
import 'package:provider/provider.dart';
class ConfigMakerScreen extends StatefulWidget {
  const ConfigMakerScreen({super.key});

  @override
  State<ConfigMakerScreen> createState() => _ConfigMakerScreenState();
}

class _ConfigMakerScreenState extends State<ConfigMakerScreen> with SingleTickerProviderStateMixin{
  int selectedTab = 0;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 12, vsync: this, initialIndex: 0);
    controller.addListener(_handleTabSelection);
  }
  @override
  void dispose() {
    // Dispose of your TabController and other resources here
    controller.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      selectedTab = controller.index; // Store the selected tab index
    });
  }
  @override
  Widget build(BuildContext context) {
    var configPvd = Provider.of<ConfigMakerProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).orientation == Orientation.portrait ? null : 30,
        title: Text('Config Maker'),
      ),
      floatingActionButton: MediaQuery.of(context).orientation == Orientation.portrait ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: MediaQuery.of(context).orientation == Orientation.portrait ? false : true,
              backgroundColor: liteYellow,
            child: Icon(Icons.add,color: Colors.black,),
              onPressed: (){
                if(controller.index == 1){
                  configPvd.sourcePumpFunctionality(['addSourcePump']);
                }else if(controller.index == 2){
                  configPvd.irrigationPumpFunctionality(['addIrrigationPump']);
                }else if(controller.index == 3){
                  configPvd.centralDosingFunctionality(['addCentralDosing']);
                }
                else if(controller.index == 4){
                  configPvd.centralFiltrationFunctionality(['addCentralFiltration']);
                }else if(controller.index == 5){
                  configPvd.irrigationLinesFunctionality(['addIrrigationLine']);
                }

          }),
          SizedBox(width: 20,),
          FloatingActionButton(
              mini: MediaQuery.of(context).orientation == Orientation.portrait ? false : true,
              backgroundColor: liteYellow,
              child: Icon(Icons.delete,color: Colors.black,),
              onPressed: (){
                if(controller.index == 1){
                  configPvd.sourcePumpFunctionality(['deleteSourcePump']);
                }else if(controller.index == 2){
                  configPvd.irrigationPumpFunctionality(['deleteIrrigationPump']);
                }else if(controller.index == 3){
                  configPvd.centralDosingFunctionality(['deleteCentralDosing']);
                }
                else if(controller.index == 4){
                  configPvd.centralFiltrationFunctionality(['deleteCentralFiltration']);
                }else if(controller.index == 5){
                  configPvd.irrigationLinesFunctionality(['deleteIrrigationLine']);
                }else if(controller.index == 6){
                  configPvd.localDosingFunctionality(['deleteLocalDosing']);
                }else if(controller.index == 7){
                  configPvd.localFiltrationFunctionality(['deleteLocalFiltration']);
                }
              }),
          SizedBox(width: 20,),
          FloatingActionButton(
              mini: MediaQuery.of(context).orientation == Orientation.portrait ? false : true,
            backgroundColor: liteYellow,
              child: Icon(Icons.batch_prediction,color: Colors.black,),
              onPressed: (){

              }),
        ],
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              mini: MediaQuery.of(context).orientation == Orientation.portrait ? false : true,
              backgroundColor: liteYellow,
              child: Icon(Icons.add,color: Colors.black,),
              onPressed: (){
                if(controller.index == 1){
                  configPvd.sourcePumpFunctionality(['addSourcePump']);
                }else if(controller.index == 2){
                  configPvd.irrigationPumpFunctionality(['addIrrigationPump']);
                }else if(controller.index == 3){
                  configPvd.centralDosingFunctionality(['addCentralDosing']);
                }
                else if(controller.index == 4){
                  configPvd.centralFiltrationFunctionality(['addCentralFiltration']);
                }
                else if(controller.index == 5){
                  configPvd.irrigationLinesFunctionality(['addIrrigationLine']);
                }

              }),
          SizedBox(height: 20,),
          FloatingActionButton(
              mini: MediaQuery.of(context).orientation == Orientation.portrait ? false : true,
              backgroundColor: liteYellow,
              child: Icon(Icons.delete,color: Colors.black,),
              onPressed: (){
                if(controller.index == 1){
                  configPvd.sourcePumpFunctionality(['deleteSourcePump']);
                }else if(controller.index == 2){
                  configPvd.irrigationPumpFunctionality(['deleteIrrigationPump']);
                }else if(controller.index == 3){
                  configPvd.centralDosingFunctionality(['deleteCentralDosing']);
                }
                else if(controller.index == 4){
                  configPvd.centralFiltrationFunctionality(['deleteCentralFiltration']);
                }else if(controller.index == 5){
                  configPvd.irrigationLinesFunctionality(['deleteIrrigationLine']);
                }else if(controller.index == 6){
                  print('6');
                  // configPvd.localDosingFunctionality(['deleteLocalDosing']);
                }else if(controller.index == 7){
                  print('7');
                  // configPvd.localFiltrationFunctionality(['deleteLocalFiltration']);
                }
              }),
          SizedBox(height: 20,),
          FloatingActionButton(
              mini: MediaQuery.of(context).orientation == Orientation.portrait ? false : true,
              backgroundColor: liteYellow,
              child: Icon(Icons.batch_prediction,color: Colors.black,),
              onPressed: (){

              }),
        ],
      ),
      body: DefaultTabController(
          length: configPvd.tabs.length,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0,1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        blurStyle: BlurStyle.outer,
                      color: Colors.black12
                    )
                  ],
                ),
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  controller: controller,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: [
                    for (var i = 0; i < configPvd.tabs.length; i++)
                      MediaQuery.of(context).orientation == Orientation.portrait ? Container(
                        height: 100,
                        width: 100,
                        child: Tab(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: double.infinity,
                            decoration: selectedTab == i ? BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                                color: liteBlue
                            ) : null,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: selectedTab != i ? Colors.yellow : null,
                                  ),
                                  child: Icon(configPvd.tabs[i][2],size: selectedTab == i ? 30 : null,),
                                  padding: selectedTab == i ? EdgeInsets.all(2) : EdgeInsets.all(8),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${configPvd.tabs[i][0]}',
                                      style: TextStyle(color: Colors.black, fontSize: selectedTab == i ? 14 : 12),
                                    ),
                                    Text(
                                      '${configPvd.tabs[i][1]}',
                                      style: TextStyle(color: Colors.black, fontSize: selectedTab == i ? 14 : 12),
                                    ),

                                  ],
                                )

                              ],
                            ),
                          ),
                        )
                      ) : Container(
                        width: 200,
                        height: 40,
                        child: Tab(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: double.infinity,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(configPvd.tabs[i][2]),
                                  Text('${configPvd.tabs[i][0]} ${configPvd.tabs[i][1]}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 15.0),
                        color: Colors.white,
                      ),
                    ),
                    SourcePumpTable(),
                    IrrigationPumpTable(),
                    CentralDosingTable(),
                    CentralFiltrationTable(),
                    IrrigationLineTable(),
                    LocalDosingTable(),
                    LocalFiltrationTable(),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 15.0),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 15.0),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 15.0),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 15.0),
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}

