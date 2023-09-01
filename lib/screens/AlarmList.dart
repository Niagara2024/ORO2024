import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oro_2024/utils/theme.dart';

enum PopupItem {s_pump, v_group, p_schedule, u_log, u_info, u_call}

class AlarmList extends StatefulWidget {
  const AlarmList({Key? key}) : super(key: key);

  @override
  State<AlarmList> createState() => _AlarmListState();
}

class _AlarmListState extends State<AlarmList> {

  bool isSwitchedSCD = false, isSwitchedST = false;
  TextEditingController timeinput = TextEditingController();
  TextEditingController timeinputDRA = TextEditingController();

  @override
  void initState() {
    timeinput.text = "HH:MM:SS";
    timeinputDRA.text = "000.0";
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alarm"),
        actions: <Widget>[
          PopupMenuButton<PopupItem>(
            icon: const Icon(Icons.filter_alt_outlined),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupItem>>[
              const PopupMenuItem<PopupItem>(
                value: PopupItem.s_pump,
                child: Text('ALL',style: TextStyle(fontSize: 16),),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.v_group,
                child: Text('Communication error',style: TextStyle(fontSize: 16),),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.p_schedule,
                child: Text('Low battery',style: TextStyle(fontSize: 16),),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.u_log,
                child: Text('Water leakage',style: TextStyle(fontSize: 16),),
              ),
            ],
          ),
        ],
      ),
      body : ListView.separated( //<-- SEE HERE
        itemCount: 10,
        itemBuilder: (context, index) {
          if(index==0){
            return ListTile(
              leading: const Icon(Icons.phonelink_erase_rounded, color: Colors.red,),
              title: const Text('RTU Communication error'),
              subtitle: Text('RTU 15'),
              trailing: Text('12 Aug 2023 \n 10:30 AM'),
            );
          }else if(index==1){
            return ListTile(
              leading: const Icon(Icons.water_drop_outlined, color: Colors.amber,),
              title: const Text('Water leakage'),
              subtitle: Text('Line 10 Water meter'),
              trailing: Text('12 Aug 2023 \n 10:35 AM'),
            );
          }else if(index==2){
            return ListTile(
              leading: const Icon(Icons.battery_alert, color: Colors.red,),
              title: const Text('RTU Low battery'),
              subtitle: Text('RF2 - RTU 25'),
              trailing: Text('12 Aug 2023 \n 10:35 AM'),
            );
          }else if(index==4){
            return ListTile(
              leading: const Icon(Icons.phonelink_erase_rounded, color: Colors.red,),
              title: const Text('RTU Communication error'),
              subtitle: Text('RTU 15'),
              trailing: Text('12 Aug 2023 \n 10:30 AM'),
            );
          }else if(index==5){
            return ListTile(
              leading: const Icon(Icons.water_drop_outlined, color: Colors.amber,),
              title: const Text('Water leakage'),
              subtitle: Text('Line 10 Water meter'),
              trailing: Text('12 Aug 2023 \n 10:35 AM'),
            );
          }else if(index==6){
            return ListTile(
              leading: const Icon(Icons.battery_alert, color: Colors.red,),
              title: const Text('RTU Low battery'),
              subtitle: Text('RF2 - RTU 25'),
              trailing: Text('12 Aug 2023 \n 10:35 AM'),
            );
          }else if(index==7){
            return ListTile(
              leading: const Icon(Icons.phonelink_erase_rounded, color: Colors.red,),
              title: const Text('RTU Communication error'),
              subtitle: Text('RTU 15'),
              trailing: Text('12 Aug 2023 \n 10:30 AM'),
            );
          }else if(index==8){
            return ListTile(
              leading: const Icon(Icons.water_drop_outlined, color: Colors.amber,),
              title: const Text('Water leakage'),
              subtitle: Text('Line 10 Water meter'),
              trailing: Text('12 Aug 2023 \n 10:35 AM'),
            );
          }else{
            return ListTile(
              leading: const Icon(Icons.battery_alert, color: Colors.red,),
              title: const Text('RTU Low battery'),
              subtitle: Text('RF2 - RTU 25'),
              trailing: Text('12 Aug 2023 \n 10:35 AM'),
            );
          }

        },
        separatorBuilder: (context, index) {//<-- SEE HERE
          return Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Divider(
              color: myTheme.primaryColor.withOpacity(0.35),
              thickness: 1.0,
            ),
          );
        },
      ),
    );
  }
}
