import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/utils/theme.dart';

class ControllerLive extends StatefulWidget {
  const ControllerLive({Key? key}) : super(key: key);

  @override
  State<ControllerLive> createState() => _ControllerLiveState();
}

class _ControllerLiveState extends State<ControllerLive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controller live',),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.refresh), onPressed: () async {
          }),
        ],
      ),
      body: Scaffold(
        backgroundColor: myTheme.primaryColor.withOpacity(0.12),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text("last sync date 03-08-2023  || 10:30 PM"),
              SizedBox(height: 10,),
              Container(
                height: 90,
                child: Card(
                  color: Colors.lightGreenAccent,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Icon(Icons.signal_cellular_alt, color: Colors.black,),
                              new Text("MOB MOTOR ON III", style: TextStyle(fontWeight: FontWeight.bold),),
                              new Icon(Icons.battery_3_bar_rounded, color: Colors.black,)
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text("85%"),
                              new Text("VRB : 229 AMP 00.0"),
                              new Text("45%")
                            ]
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Container(
                child: new Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : Card(
                        color: Colors.red.withOpacity(0.8),
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("R 076 V", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("RY 131 V", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("C1 00.0 A", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),),
                    new Expanded (
                      flex:1,
                      child : Card(
                        color: Colors.yellow.withOpacity(0.8),
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("Y 076 V", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("YB 131 V", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("C2 00.0 A", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),),
                    new Expanded (
                      flex:1,
                      child : Card(
                        color: Colors.blueAccent.withOpacity(0.8),
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("B 076 V", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("BR 131 V", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("C3 00.0 A", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text("Phase : 3bPhase        Battery volt : 4.0 "),
              SizedBox(height: 10,),
              Container(
                child: new Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("Pressure In", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Image.asset('assets/images/speedometer.png'),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("10.0 Bar", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(5),
                      ),),
                    new Expanded (
                      flex:1,
                      child : Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("Pressure Out", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Image.asset('assets/images/speedometer.png'),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("9.5 Bar", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(5),
                      ),),
                    new Expanded (
                      flex:1,
                      child : Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("Flow Rate", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Image.asset('assets/images/speedometer.png'),
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text("25.0 L/s", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(5),
                      ),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text("Well Level       30%     21.0 Feets"),
              SizedBox(height: 10,),
              Container(
                height: 170,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text("      "),
                              new Text("  Today"),
                              new Text("Pre day")
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text("Run Time"),
                              new Text("12:00:00  "),
                              new Text("10:20:30  ")
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text("Flow     "),
                              new Text("2500 Lts"),
                              new Text("3200 Lts")
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text("Cum flow"),
                              new Text("21050 Lts"),
                              new Text("25250 Lts")
                            ]
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
