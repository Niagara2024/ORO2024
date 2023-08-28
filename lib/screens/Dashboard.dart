import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/screens/Settings.dart';

enum PopupItem {s_pump, v_group, p_schedule, u_log, u_info, u_call}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ORO GEM',),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.refresh), onPressed: () async {

          }),
          IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Settings()));
          }),
          PopupMenuButton<PopupItem>(
            color: Colors.white,
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupItem>>[
              const PopupMenuItem<PopupItem>(
                value: PopupItem.s_pump,
                child: Text('Irrigation Program'),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.v_group,
                child: Text('Water sources'),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.p_schedule,
                child: Text('Virtual water meters'),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.u_log,
                child: Text('Radiation sets'),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.u_log,
                child: Text('Satellite'),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.u_log,
                child: Text('Groups'),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.u_log,
                child: Text('Conditions'),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.u_log,
                child: Text('Frost protection'),
              ),
              const PopupMenuItem<PopupItem>(
                value: PopupItem.u_log,
                child: Text('Rain delay'),
              ),
            ],
          ),
        ],
      ),
      body: Card(
        margin: const EdgeInsets.all(20),
        child: InkWell(
          onTap: () {
            print("tapped");
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('ORO GEM',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
