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
            ListView(
              children: [
                Container(
                  color: myTheme.primaryColor.withOpacity(0.15),
                  height: 60,
                  alignment: FractionalOffset.center,
                  child: Wrap(
                      spacing: 2,
                      alignment: WrapAlignment.center,
                      children: [
                        GestureDetector(
                          child: Chip(
                            label: Text("Defaults",),
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
                            label: Text("Features",),
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
                            label: Text("Irrigation",),
                            backgroundColor: tabFTIndex == 2? Colors.amber : Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              tabFTIndex = 2;
                            });
                          },
                        ),
                        GestureDetector(
                          child: Chip(
                            label: Text("Fertilization",),
                            backgroundColor: tabFTIndex == 3? Colors.amber : Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              tabFTIndex = 3;
                            });
                          },
                        ),
                      ]),
                ),
                CtrlSelcIndex == 0? Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.power_outlined, color: Colors.blue,),
                      title: Text('Name'),
                      trailing: Text('ORO GEM', style: TextStyle(fontSize: 15),),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                      title: Text('Use USA Units'),
                      trailing: Switch(
                        value: isSwitchedST,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent,
                        onChanged: (value){
                          setState(() {
                            isSwitchedST = value;
                          });
                        },
                      ),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.power_outlined, color: Colors.blue,),
                      title: Text('Water accumulation unit'),
                      trailing: Text('M3', style: TextStyle(fontSize: 15),),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.power_outlined, color: Colors.blue,),
                      title: Text('Gradual opening delay'),
                      trailing: Text('0', style: TextStyle(fontSize: 15),),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.power_outlined, color: Colors.blue,),
                      title: Text('Default nominal flow'),
                      trailing: Text('100', style: TextStyle(fontSize: 15),),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.power_outlined, color: Colors.blue,),
                      title: Text('Min flow deviation'),
                      trailing: Text('25', style: TextStyle(fontSize: 15),),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.power_outlined, color: Colors.blue,),
                      title: Text('Max flow deviation'),
                      trailing: Text('25', style: TextStyle(fontSize: 15),),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.power_outlined, color: Colors.blue,),
                      title: Text('No pressure delay'),
                      trailing: Text('01:00', style: TextStyle(fontSize: 15),),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.power_outlined, color: Colors.blue,),
                      title: Text('Fill time'),
                      trailing: Text('00:15', style: TextStyle(fontSize: 15),),
                      onTap: () { },
                    ),
                  ],
                ) : Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.power_outlined, color: Colors.blue,),
                      title: Text('Named groups'),
                      trailing: Switch(
                        value: isSwitchedST,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent,
                        onChanged: (value){
                          setState(() {
                            isSwitchedST = value;
                          });
                        },
                      ),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                      title: Text('Unnamed groups'),
                      trailing: Switch(
                        value: isSwitchedST,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent,
                        onChanged: (value){
                          setState(() {
                            isSwitchedST = value;
                          });
                        },
                      ),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                      title: Text('Conditions'),
                      trailing: Switch(
                        value: isSwitchedST,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent,
                        onChanged: (value){
                          setState(() {
                            isSwitchedST = value;
                          });
                        },
                      ),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                      title: Text('Evaporation control'),
                      trailing: Switch(
                        value: isSwitchedST,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent,
                        onChanged: (value){
                          setState(() {
                            isSwitchedST = value;
                          });
                        },
                      ),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                      title: Text('Accumulated radiation'),
                      trailing: Switch(
                        value: isSwitchedST,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent,
                        onChanged: (value){
                          setState(() {
                            isSwitchedST = value;
                          });
                        },
                      ),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                      title: Text('Frost protection'),
                      trailing: Switch(
                        value: isSwitchedST,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent,
                        onChanged: (value){
                          setState(() {
                            isSwitchedST = value;
                          });
                        },
                      ),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                      title: Text('Rain delay'),
                      trailing: Switch(
                        value: isSwitchedST,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent,
                        onChanged: (value){
                          setState(() {
                            isSwitchedST = value;
                          });
                        },
                      ),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                      title: Text('Sound alarms'),
                      trailing: Switch(
                        value: isSwitchedST,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent,
                        onChanged: (value){
                          setState(() {
                            isSwitchedST = value;
                          });
                        },
                      ),
                      onTap: () { },
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                      title: Text('Show IO communication problems'),
                      trailing: Switch(
                        value: isSwitchedST,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent,
                        onChanged: (value){
                          setState(() {
                            isSwitchedST = value;
                          });
                        },
                      ),
                      onTap: () { },
                    ),
                  ],
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Name'),
                  trailing: Text('ORO GEM', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                  title: Text('Use USA Units'),
                  trailing: Switch(
                    value: isSwitchedST,
                    activeColor: Colors.green,
                    activeTrackColor: Colors.greenAccent,
                    onChanged: (value){
                      setState(() {
                        isSwitchedST = value;
                      });
                    },
                  ),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Water accumulation unit'),
                  trailing: Text('M3', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Gradual opening delay'),
                  trailing: Text('0', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Default nominal flow'),
                  trailing: Text('100', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Min flow deviation'),
                  trailing: Text('25', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Max flow deviation'),
                  trailing: Text('25', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('No pressure delay'),
                  trailing: Text('01:00', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Fill time'),
                  trailing: Text('00:15', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Name'),
                  trailing: Text('ORO GEM', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.watch_later_outlined, color: Colors.blue,),
                  title: Text('Use USA Units'),
                  trailing: Switch(
                    value: isSwitchedST,
                    activeColor: Colors.green,
                    activeTrackColor: Colors.greenAccent,
                    onChanged: (value){
                      setState(() {
                        isSwitchedST = value;
                      });
                    },
                  ),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Water accumulation unit'),
                  trailing: Text('M3', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Gradual opening delay'),
                  trailing: Text('0', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Default nominal flow'),
                  trailing: Text('100', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Min flow deviation'),
                  trailing: Text('25', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Max flow deviation'),
                  trailing: Text('25', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('No pressure delay'),
                  trailing: Text('01:00', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
                ListTile(
                  leading: Icon(Icons.power_outlined, color: Colors.blue,),
                  title: Text('Fill time'),
                  trailing: Text('00:15', style: TextStyle(fontSize: 15),),
                  onTap: () { },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
