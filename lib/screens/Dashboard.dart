import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oro_2024/screens/ControllerLive.dart';
import 'package:oro_2024/screens/Settings.dart';
import 'package:oro_2024/utils/theme.dart';

class ControllerDashboardScreen3 extends StatefulWidget {
  const ControllerDashboardScreen3({super.key});

  @override
  State<ControllerDashboardScreen3> createState() => _ControllerDashboardScreen3State();
}

class _ControllerDashboardScreen3State extends State<ControllerDashboardScreen3> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> blinkAnimation;
  bool l1v1Switch = false;
  String dropdownValue = 'Manual';
  bool deviceList = true;
  bool mapScreen = false;

  Map<String, String> waterSources = {
    'WS1': 'Source A',
    'WS2': 'Source B',
    'WS3': 'Source C',
  };
  Map<String, String> waterPumps = {
    'P1': 'Pump 1',
    'P2': 'Pump 2',
    'P3': 'Pump 3',
  };
  Map<String, String> channels = {
    'C1': 'Channel 1',
    'C2': 'Channel 2',
    'C3': 'Channel 3',
  };
  Map<String, String> filters = {
    'F1': 'Filters 1',
    'F2': 'Filters 2',
    'F3': 'Filters 3',
  };

  List<String> activeWaterSources = [];
  List<String> activeWaterPumps = [];
  List<String> activeChannels = [];
  List<String> activeFilters = [];

  bool isBlinking = false;

  // Simulating fetching active status from API
  void fetchActiveStatusFromAPI() {
    List<String> fetchedActiveSources = ['WS2'];
    List<String> fetchedActivePumps = ['P3'];
    List<String> fetchedActiveChannels = ['C2'];
    List<String> fetchedActiveFilters = ['F3'];

    setState(() {
      activeWaterSources = fetchedActiveSources;
      activeWaterPumps = fetchedActivePumps;
      activeChannels = fetchedActiveChannels;
      activeFilters = fetchedActiveFilters;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    blinkAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
    fetchActiveStatusFromAPI();

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        isBlinking = !isBlinking;
      });
    });

  }

  int? selectedValue = 1;

  void handleRadioValueChanged(int? value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    List<String> orderedKeys = waterSources.keys.toList();
    orderedKeys.removeWhere((key) => activeWaterSources.contains(key));
    orderedKeys.insertAll(0, activeWaterSources);

    List<String> pumpOrderedKeys = waterPumps.keys.toList();
    pumpOrderedKeys.removeWhere((key) => activeWaterPumps.contains(key));
    pumpOrderedKeys.insertAll(0, activeWaterPumps);

    List<String> channelOrderKeys = channels.keys.toList();
    channelOrderKeys.removeWhere((key) => activeChannels.contains(key));
    channelOrderKeys.insertAll(0, activeChannels);

    List<String> filtersOrderKeys = filters.keys.toList();
    filtersOrderKeys.removeWhere((key) => activeFilters.contains(key));
    filtersOrderKeys.insertAll(0, activeFilters);

    orderedKeys.addAll(pumpOrderedKeys);
    orderedKeys.addAll(channelOrderKeys);
    orderedKeys.addAll(filtersOrderKeys);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ORO GEM'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: fetchActiveStatusFromAPI,
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Settings()));
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  surfaceTintColor: Colors.white,
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                            color: deviceList ? Theme.of(context).primaryColor : null,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (!deviceList) {
                                  deviceList = true;
                                  mapScreen = false;
                                }
                              });
                            },
                            icon: Icon(Icons.view_list, color: deviceList ? Theme.of(context).colorScheme.secondary : null),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                            color: mapScreen ? Theme.of(context).primaryColor : null,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (!mapScreen) {
                                  mapScreen = true;
                                  deviceList = false;
                                }
                              });
                            },
                            icon: Icon(Icons.map_outlined, color: mapScreen ? Theme.of(context).colorScheme.secondary : null),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  surfaceTintColor: Colors.white,
                  child: SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        underline: Container(),
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'Manual',
                          'Program 1',
                          'Program 2',
                          'Banana South',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: Card(
                    surfaceTintColor: Colors.white,
                    child: SizedBox(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.lightbulb_rounded, color: Theme.of(context).colorScheme.secondary,),
                            Icon(Icons.lightbulb_rounded, color: Theme.of(context).colorScheme.secondary,),
                            const Icon(Icons.lightbulb_outline)
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const ControllerLive()));
                  },
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 5,
                    spreadRadius:0,
                  ),
                ],
                color: Colors.white,

              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 80,
                ),
                itemCount: orderedKeys.length,
                itemBuilder: (context, index) {
                  String key = orderedKeys[index];
                  String? value;

                  if (waterSources.containsKey(key)) {
                    value = waterSources[key];
                  } else if (waterPumps.containsKey(key)) {
                    value = waterPumps[key];
                  }else if (channels.containsKey(key)) {
                    value = channels[key];
                  }else if (filters.containsKey(key)) {
                    value = filters[key];
                  }

                  bool isActiveWaterSource = activeWaterSources.contains(key);
                  bool isActiveWaterPump = activeWaterPumps.contains(key);
                  bool isActiveChannels = activeChannels.contains(key);
                  bool isActiveFilters = activeFilters.contains(key);

                  return buildAvatarColumn(isActiveWaterSource || isActiveWaterPump  || isActiveChannels || isActiveFilters, value, key, context);
                },
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: handleRadioValueChanged,
                    ),
                    const Text('Default'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: handleRadioValueChanged,
                    ),
                    const Text('Time'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: selectedValue,
                      onChanged: handleRadioValueChanged,
                    ),
                    const Text('Flow'),
                  ],
                ),            ],
            ),
            Row(
              children: [
                // Container(height: 2, width: 30, color: Theme.of(context).primaryColor,),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Line 1', style: TextStyle(fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight, fontSize: 19),),
                        Column(
                          children: [
                            const Icon(Icons.input),
                            Text('0.5 bar', style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.output),
                            Text('0.5 bar', style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if(selectedValue == 2)
                  Row(
                    children: [
                      Text('Total : ', style: Theme.of(context).textTheme.bodyMedium),
                      Text('01:00:00', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                if(selectedValue == 2)
                  Row(
                    children: [
                      Text('Rem : ', style: Theme.of(context).textTheme.bodyMedium),
                      Text('00:45:00', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                if(selectedValue == 3)
                  Row(
                    children: [
                      Text('Total : ', style: Theme.of(context).textTheme.bodyMedium),
                      Text('500 m³/h', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                if(selectedValue == 3)
                  Row(
                    children: [
                      Text('Rem : ', style: Theme.of(context).textTheme.bodyMedium),
                      Text('100 m³/h', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
              ],
            ),
            if(selectedValue == 2 || selectedValue == 3)
              const SizedBox(height: 10,),
            Container(
              height: (selectedValue == 2 || selectedValue == 3) ? 320 : 360,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Container(height: 2, width: 30, color: Theme.of(context).primaryColor,),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                  spreadRadius:0,
                                ),
                              ],
                              color: Colors.white,

                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                      color: Colors.green,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/images/valve.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Text('Valve 01', style: Theme.of(context).textTheme.bodyLarge,),
                                              Text('Coconut tree', style: Theme.of(context).textTheme.bodyMedium,),
                                            ],
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          if(selectedValue == 1)
                                            Switch(
                                                value: l1v1Switch,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    l1v1Switch = newValue;
                                                  });
                                                }
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Set time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:10:00', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 2)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Rem time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:00:00', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.green, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Set flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('100 m³/h', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Rem flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('50 m³/h', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.green, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        // Container(height: 2, width: 30, color: Theme.of(context).primaryColor,),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                  spreadRadius:0,
                                ),
                              ],
                              color: Colors.white,

                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                      color: Colors.red,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/images/valve.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Text('Valve 02', style: Theme.of(context).textTheme.bodyLarge,),
                                              Text('Coconut tree', style: Theme.of(context).textTheme.bodyMedium,),
                                            ],
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          if(selectedValue == 1)
                                            Switch(
                                                value: l1v1Switch,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    l1v1Switch = newValue;
                                                  });
                                                }
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Set time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:15:00', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 2)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Rem time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:10:00', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.red, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Set flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('100 m³/h', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Rem flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('50 m³/h', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.red, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        // Container(height: 2, width: 30, color: Theme.of(context).primaryColor,),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                  spreadRadius:0,
                                ),
                              ],
                              color: Colors.white,

                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/images/valve.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Text('Valve 03', style: Theme.of(context).textTheme.bodyLarge,),
                                              Text('Coconut tree', style: Theme.of(context).textTheme.bodyMedium,),
                                            ],
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          if(selectedValue == 1)
                                            Switch(
                                                value: l1v1Switch,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    l1v1Switch = newValue;
                                                  });
                                                }
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Set time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:30:00', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 2)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Rem time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:15:56', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.blue, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Set flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('120 m³/h', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Rem flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('70 m³/h', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.blue, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        // Container(height: 2, width: 30, color: Theme.of(context).primaryColor,),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                  spreadRadius:0,
                                ),
                              ],
                              color: Colors.white,

                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/images/valve.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Text('Valve 03', style: Theme.of(context).textTheme.bodyLarge,),
                                              Text('Coconut tree', style: Theme.of(context).textTheme.bodyMedium,),
                                            ],
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          if(selectedValue == 1)
                                            Switch(
                                                value: l1v1Switch,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    l1v1Switch = newValue;
                                                  });
                                                }
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Set time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:30:00', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 2)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Rem time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:15:56', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.blue, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Set flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('120 m³/h', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Rem flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('70 m³/h', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.blue, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        // Container(height: 2, width: 30, color: Theme.of(context).primaryColor,),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                  spreadRadius:0,
                                ),
                              ],
                              color: Colors.white,

                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/images/valve.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Text('Valve 03', style: Theme.of(context).textTheme.bodyLarge,),
                                              Text('Coconut tree', style: Theme.of(context).textTheme.bodyMedium,),
                                            ],
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          if(selectedValue == 1)
                                            Switch(
                                                value: l1v1Switch,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    l1v1Switch = newValue;
                                                  });
                                                }
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Set time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:30:00', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 2)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Rem time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:15:56', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.blue, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Set flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('120 m³/h', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Rem flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('70 m³/h', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.blue, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        // Container(height: 2, width: 30, color: Theme.of(context).primaryColor,),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                  spreadRadius:0,
                                ),
                              ],
                              color: Colors.white,

                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/images/valve.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Text('Valve 03', style: Theme.of(context).textTheme.bodyLarge,),
                                              Text('Coconut tree', style: Theme.of(context).textTheme.bodyMedium,),
                                            ],
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          if(selectedValue == 1)
                                            Switch(
                                                value: l1v1Switch,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    l1v1Switch = newValue;
                                                  });
                                                }
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Set time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:30:00', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 2)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 2)
                                            Column(
                                              children: [
                                                Text('Rem time', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('00:15:56', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.blue, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Set flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('120 m³/h', style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          if(selectedValue == 3)
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          if(selectedValue == 3)
                                            Column(
                                              children: [
                                                Text('Rem flow', style: Theme.of(context).textTheme.bodyMedium,),
                                                Text('70 m³/h', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.blue, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 70,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  Widget buildAvatarColumn(bool isActive, String? value, String key, BuildContext context) {
    Widget icon;
    if (waterSources.containsKey(key)) {
      icon = Icon(
        Icons.water_outlined,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        size: isActive ? 24.0 * blinkAnimation.value : 24.0,
      );
    } else if (waterPumps.containsKey(key)) {
      icon = Icon(
        Icons.local_drink,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        size: isActive ? 24.0 * blinkAnimation.value : 24.0,
      );
    } else if (channels.containsKey(key)) {
      icon = Icon(
        Icons.propane_tank,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        size: isActive ? 24.0 * blinkAnimation.value : 24.0,
      );
    } else if (filters.containsKey(key)) {
      icon = Icon(
        Icons.filter_alt_rounded,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        size: isActive ? 24.0 * blinkAnimation.value : 24.0,
      );
    } else {
      icon = const Icon(Icons.error);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: isActive
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).primaryColor,
            child: icon,
          ),
          Center(
            child: Text(
              '$value',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
