import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/utils/theme.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool isSwitchedSCD = true, isSwitchedST = true;
  int tabFTIndex = 0;
  int CtrlSelcIndex = 0;

  int PmtabFTIndex = 0;
  int PupmSelcIndex = 0;

  int NttabFTIndex = 0;
  int NtSelcIndex = 0;

  ScrollController _controller = new ScrollController();

  final List _peopleData = List.generate(1000, (index) {
    return {"name": "Person \#$index", "age": Random().nextInt(90) + 10};
  });

  // Item of the ListView
  Widget _listItem(index) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: Text(index.toString(), style: const TextStyle(fontSize: 18)),
        title: Text(
          _peopleData[index]['name'].toString(),
          style: const TextStyle(fontSize: 18),
        ),
        trailing: Text(_peopleData[index]['age'].toString(),
            style: const TextStyle(fontSize: 18, color: Colors.purple)),
      ),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black26))),
    );
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.settings_outlined), child: Text('Controller')),
              Tab(icon: Icon(Icons.heat_pump), child: Text('Pump')),
              Tab(icon: Icon(Icons.add_alert_sharp), child: Text('Notification')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: <Widget>[
                Expanded (
                  flex:1,
                  child : Container(
                    color: myTheme.primaryColor.withOpacity(0.15),
                    alignment: FractionalOffset.center,
                    child: Wrap(
                        spacing: 2,
                        alignment: WrapAlignment.center,
                        children: [
                          GestureDetector(
                            child: Chip(
                              label: const Text("Defaults",),
                              backgroundColor: tabFTIndex == 0? Colors.amber : Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                tabFTIndex = 0;
                                CtrlSelcIndex = 0;
                              });

                            },
                          ),
                          GestureDetector(
                            child: Chip(
                              label: const Text("Features",),
                              backgroundColor: tabFTIndex == 1? Colors.amber : Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                tabFTIndex = 1;
                                CtrlSelcIndex = 1;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Chip(
                              label: const Text("Irrigation",),
                              backgroundColor: tabFTIndex == 2? Colors.amber : Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                tabFTIndex = 2;
                                CtrlSelcIndex = 2;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Chip(
                              label: const Text("Fertilization",),
                              backgroundColor: tabFTIndex == 3? Colors.amber : Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                tabFTIndex = 3;
                                CtrlSelcIndex = 3;
                              });
                            },
                          ),
                        ]),
                  ),),
                Expanded(
                  flex :10,
                  child: ListView(
                    children:[
                      Container(
                        color: myTheme.primaryColor.withOpacity(0.15),
                        child: Card(
                          margin: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
                          child: CtrlSelcIndex == 0?
                          Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Name'),
                                trailing: Text('ORO GEM', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Use USA Units'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Water accumulation unit'),
                                trailing: Text('M3', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Gradual opening delay'),
                                trailing: Text('0', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Default nominal flow'),
                                trailing: Text('100', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Min flow deviation'),
                                trailing: Text('25', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Max flow deviation'),
                                trailing: Text('25', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('No pressure delay'),
                                trailing: Text('01:00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Fill time'),
                                trailing: Text('00:15', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                            ],
                          ) :
                          CtrlSelcIndex == 1?
                          Column(children: [
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Named groups'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Unnamed groups'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Conditions'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Evaporation control'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Accumulated radiation'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Frost protection'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Rain delay'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Sound alarms'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Show IO communication problems'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                          ],) :
                          CtrlSelcIndex == 2?
                          Column(children: [
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Cycles'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Priority'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Priority'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Dosage per area'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Default dosage mode'),
                              trailing: Text('hh:mm:ss', style: TextStyle(fontSize: 15),),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Stop time=>Max duration'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Halt on repeated flow problems'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Enable long sequences'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Reuse valve in sequence'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Parallel programs in line'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('DP control during line filling'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Run list length'),
                              trailing: Text('7', style: TextStyle(fontSize: 15),),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Current irrigation day'),
                              trailing: Text('7', style: TextStyle(fontSize: 15),),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Common dosage coefficient'),
                              trailing: Text('100', style: TextStyle(fontSize: 15),),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: const Text('Reset time'),
                              trailing: const Text('00:00', style: TextStyle(fontSize: 15),),
                              onTap: () { },
                            ),
                          ],) :
                          Column(children: [
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Special water before'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Fertilizer leakage limit'),
                              trailing: Text('10', style: TextStyle(fontSize: 15),),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                              title: Text('Sequential fertilization'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Use fertilizer sets'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Local fert mode liter/m3'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Local fert mode sec/min'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Local fert mode min.sec/m3'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Local fert liter/min'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Local fert proportional'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Local fert bulk by time'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Local fert bulk by volume'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Default fert mode'),
                              trailing: Text('L/m3', style: TextStyle(fontSize: 15),),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Notify about fertilizer lefts'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Notify about fertilizer lefts'),
                              trailing: Text('00:15', style: TextStyle(fontSize: 15),),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: Text('Detection delay of no fertilizer flow'),
                              trailing: Text('00', style: TextStyle(fontSize: 15),),
                              onTap: () { },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                              title: const Text('Water pulse before fert'),
                              trailing: Switch(
                                value: isSwitchedST,
                                activeColor: Colors.amber,
                                activeTrackColor: myTheme.primaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isSwitchedST = value;
                                  });
                                },
                              ),
                              onTap: () { },
                            ),
                          ],),
                        ),
                      ),
                    ] ,
                  ))
              ],
            ),
            Column(
              children: <Widget>[
                Expanded (
                  flex:1,
                  child : Container(
                    color: myTheme.primaryColor.withOpacity(0.15),
                    alignment: FractionalOffset.center,
                    child: Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          GestureDetector(
                            child: Chip(
                              label: Text("Timer",),
                              backgroundColor: PmtabFTIndex == 0? Colors.amber : Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                PmtabFTIndex = 0;
                                PupmSelcIndex = 0;
                              });

                            },
                          ),
                          GestureDetector(
                            child: Chip(
                              label: Text("Current",),
                              backgroundColor: PmtabFTIndex == 1? Colors.amber : Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                PmtabFTIndex = 1;
                                PupmSelcIndex = 1;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Chip(
                              label: Text("Voltage",),
                              backgroundColor: PmtabFTIndex == 2? Colors.amber : Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                PmtabFTIndex = 2;
                                PupmSelcIndex = 2;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Chip(
                              label: Text("Additional",),
                              backgroundColor: PmtabFTIndex == 3? Colors.amber : Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                PmtabFTIndex = 3;
                                PupmSelcIndex = 3;
                              });
                            },
                          ),
                        ]),
                  ),),
                Expanded(
                    flex :10,
                    child: ListView(
                      children:[
                        Container(
                          color: myTheme.primaryColor.withOpacity(0.15),
                          child: Card(
                            margin: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
                            child: PupmSelcIndex == 0?
                            Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('On delay timer'),
                                  trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('Start to delta'),
                                  trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Starting capacitor'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('Starting capacitor timer'),
                                  trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('Starter feedback'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('SFB Daley timer'),
                                  trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('Maximum run'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('Maximum timer'),
                                  trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('Cyclic timer'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('Cyclic On time'),
                                  trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('Cyclic Off time'),
                                  trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('RTC Timer'),
                                  trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('RTC one on time'),
                                  trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                  title: Text('RTC one off time'),
                                  trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                  onTap: () { },
                                ),
                              ],
                            ) : PupmSelcIndex == 1?
                            Column(children: [
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Dry run'),
                                trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Dry run 3 Phase'),
                                trailing: Text('000.0', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Dry run 2 Phase'),
                                trailing: Text('000.0', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Dry run restart'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Dry run restart Timer'),
                                trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Over load'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Over load 3 Phase'),
                                trailing: Text('000.0', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Over load 2 Phase'),
                                trailing: Text('000.0', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Dry run occurrence'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Dry run occurrence timer'),
                                trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Dry run occurrence Number'),
                                trailing: Text('00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('CTR'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('CTY'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('CTB'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                            ],) : PupmSelcIndex == 2?
                            Column(children: [
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Low volt'),
                                trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Low volt 3 Phase'),
                                trailing: Text('000.0', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Low volt 2 Phase'),
                                trailing: Text('000.0', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Diff Low volt 2 Phase'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('High volt'),
                                trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('High volt 3 Phase'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Diff High volt 3 Phase'),
                                trailing: Text('000.0', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('High volt 2 Phase'),
                                trailing: Text('000.0', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Deff High volt 2 Phase'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Imbalance voltage'),
                                trailing: Text('00:00:00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('voltage spp'),
                                trailing: Text('00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Reverse phase'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                            ],) :
                            Column(children: [
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Tank'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Sump'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Schedule by day'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Run days'),
                                trailing: Text('00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: Icon(Icons.power_outlined, color: myTheme.primaryColor,),
                                title: Text('Left days'),
                                trailing: Text('00', style: TextStyle(fontSize: 15),),
                                onTap: () { },
                              ),
                            ],),
                          ),
                        ),
                      ] ,
                    )),
              ],
            ),
            Column(
              children: <Widget>[
                Expanded (
                  flex:1,
                  child : Container(
                    color: myTheme.primaryColor.withOpacity(0.15),
                    alignment: FractionalOffset.center,
                    child: Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          GestureDetector(
                            child: Chip(
                              label: Text("Event subscription ",),
                              backgroundColor: NttabFTIndex == 0? Colors.amber : Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                NttabFTIndex = 0;
                                NtSelcIndex = 0;
                              });

                            },
                          ),
                          GestureDetector(
                            child: Chip(
                              label: Text("Alarms subscription",),
                              backgroundColor: NtSelcIndex == 1? Colors.amber : Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                NttabFTIndex = 1;
                                NtSelcIndex = 1;
                              });
                            },
                          ),

                        ]),
                  ),),
                Expanded(
                    flex :10,
                    child: ListView(
                      children:[
                        Container(
                          color: myTheme.primaryColor.withOpacity(0.15),
                          child: Card(
                            margin: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
                            child: NtSelcIndex == 0?
                            Column(
                              children: [
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('No ac power'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Low battery'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Manual start'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Manual stop'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Start of cycle'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('End of cycle'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Start by condition'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('End by condition'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Valves open'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Valves close'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Program finished'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Low pressure'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('High flow'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Low flow'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                                ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                  title: Text('Backwash'),
                                  trailing: Switch(
                                    value: isSwitchedST,
                                    activeColor: Colors.amber,
                                    activeTrackColor: myTheme.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchedST = value;
                                      });
                                    },
                                  ),
                                  onTap: () { },
                                ),
                              ],
                            ) :
                            Column(children: [
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Low battery'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('RTU low battery'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('RTU communication problem'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Low pressure'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('No water pressure'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Water leakage'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Fertilizer leakage'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('No AC'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Ec failure'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('pH failure '),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Ec and pH sensor data missmatch'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Repeated flow problem'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Rain delay'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Frost production'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                              ListTile(
                                leading: const CircleAvatar(child: Icon(Icons.timer, color: Colors.white,),),
                                title: Text('Unresponsive valve problem'),
                                trailing: Switch(
                                  value: isSwitchedST,
                                  activeColor: Colors.amber,
                                  activeTrackColor: myTheme.primaryColor,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitchedST = value;
                                    });
                                  },
                                ),
                                onTap: () { },
                              ),
                            ],),
                          ),
                        ),
                      ] ,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
