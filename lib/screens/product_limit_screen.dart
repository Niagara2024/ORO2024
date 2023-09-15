import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/my_assets.dart';


class ProductLimitScreen extends StatefulWidget {
  const ProductLimitScreen({super.key});

  @override
  State<ProductLimitScreen> createState() => _ProductLimitScreenState();
}

class _ProductLimitScreenState extends State<ProductLimitScreen> {

  MyAssets? myAssets;
  final List<TitleAndIcon> titleAndIcon = [
    TitleAndIcon('Valve', Icons.settings),
    TitleAndIcon('Main Valve', Icons.settings_input_svideo),
    TitleAndIcon('Main Filter Valve', Icons.filter_alt),
    TitleAndIcon('No.of Source Pumps', Icons.water),
    TitleAndIcon('No.of Irrigation Pumps', Icons.spa),
    TitleAndIcon('No.of Filters', Icons.filter_alt_outlined),
    TitleAndIcon('No.of Fertilizers', Icons.grass),
    TitleAndIcon('Dosing Channel', Icons.add_circle_outline),
    TitleAndIcon('Dosing Booster', Icons.add_box),
    TitleAndIcon('Selector', Icons.select_all),
    TitleAndIcon('Agitator', Icons.shuffle),
    TitleAndIcon('No.of Weather Stations', Icons.wb_sunny),
    TitleAndIcon('No.of RTUs', Icons.router),
    TitleAndIcon('No.of Xtend', Icons.signal_cellular_4_bar),
    TitleAndIcon('No.of Sense', Icons.track_changes),
    TitleAndIcon('No.of level', Icons.swap_vertical_circle),
    TitleAndIcon('No. of Switch', Icons.toggle_on),
    TitleAndIcon('Conditions', Icons.check_circle),
    TitleAndIcon('Alarm Groups', Icons.notifications_active),
    TitleAndIcon('Radiation Sets', Icons.waves),
    TitleAndIcon('Satellites', Icons.satellite),
    TitleAndIcon('Analog Sensors', Icons.speed),
    TitleAndIcon('Contacts', Icons.contact_phone),
    TitleAndIcon('No. of Site', Icons.location_city),
    TitleAndIcon('Cooling', Icons.ac_unit),
    TitleAndIcon('Water Heater', Icons.hot_tub),
    TitleAndIcon('Virtual Water Meter', Icons.show_chart),
    TitleAndIcon('Free Water Meters', Icons.bathtub),
    TitleAndIcon('EC P - Ctrl Open', Icons.lock_open),
    TitleAndIcon('EC P - Ctrl Close', Icons.lock_outline),
    TitleAndIcon('EC P - Ctrl Pump', Icons.call_to_action),
    TitleAndIcon('Same As Relay', Icons.compare_arrows),
  ];

  List<String> selectedValues = [];
  List<List<String>> valueCounts = [];

  Future<void> fetchDataFromApi() async {
    const apiResponse = '{'
        '"valve": "20", '
        '"mainValve": "10", '
        '"mainFilterValve": "15",'
        '"sourcePump": "15",'
        '"irrigationPump": "5",'
        '"filter": "8",'
        '"fertilizers": "4",'
        '"dosingChannel": "4",'
        '"dosingBooster": "4",'
        '"selector": "4",'
        '"agitator": "4",'
        '"weatherStations": "4",'
        '"rtu": "4",'
        '"xtend": "4",'
        '"sense": "4",'
        '"level": "4",'
        '"switches": "20", '
        '"conditions": "15",'
        '"alarmGroups": "15",'
        '"radiationSets": "5",'
        '"satellites": "4",'
        '"analogSensors": "4",'
        '"contacts": "4",'
        '"sites": "4",'
        '"cooling": "4",'
        '"waterHeater": "4",'
        '"virtualWaterMeter": "10", '
        '"freeWaterMeters": "8",'
        '"ecOpen": "4",'
        '"ecClose": "4",'
        '"ecPump": "4",'
        '"sameAsRelay": "4"'
        '}';
    final Map<String, dynamic> data = json.decode(apiResponse);

    setState(() {
      myAssets = MyAssets.fromMap(data);
      selectedValues = [
        myAssets!.valve,
        myAssets!.mainValve,
        myAssets!.mainFilterValve,
        myAssets!.sourcePump,
        myAssets!.irrigationPump,
        myAssets!.filter,
        myAssets!.fertilizers,
        myAssets!.dosingChannel,
        myAssets!.dosingBooster,
        myAssets!.selector,
        myAssets!.agitator,
        myAssets!.weatherStations,
        myAssets!.rtu,
        myAssets!.xtend,
        myAssets!.sense,
        myAssets!.level,
        myAssets!.switches,
        myAssets!.conditions,
        myAssets!.alarmGroups,
        myAssets!.radiationSets,
        myAssets!.satellites,
        myAssets!.analogSensors,
        myAssets!.contacts,
        myAssets!.sites,
        myAssets!.cooling,
        myAssets!.waterHeater,
        myAssets!.virtualWaterMeter,
        myAssets!.freeWaterMeters,
        myAssets!.ecOpen,
        myAssets!.ecClose,
        myAssets!.ecPump,
        myAssets!.sameAsRelay,
      ];
      valueCounts = [
        List.generate(int.parse(myAssets?.valve ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.mainValve ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.mainFilterValve ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.sourcePump ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.irrigationPump ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.filter ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.fertilizers ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.dosingChannel ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.dosingBooster ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.selector ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.agitator ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.weatherStations ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.rtu ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.xtend ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.sense ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.level ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.switches ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.conditions ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.alarmGroups ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.radiationSets ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.satellites ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.analogSensors ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.contacts ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.sites ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.cooling ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.waterHeater ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.virtualWaterMeter ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.freeWaterMeters ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.ecOpen ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.ecClose ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.ecPump ?? '0'), (index) => (index + 1).toString()),
        List.generate(int.parse(myAssets?.sameAsRelay ?? '0'), (index) => (index + 1).toString()),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    final filteredTitleAndIcon = titleAndIcon.where((config) {
      final index = titleAndIcon.indexOf(config);
      final selectedValue = selectedValues[index];
      return selectedValue != '' && selectedValue != "0";
    }).toList();

    return Padding(
      padding: const EdgeInsets.only( left: 10, right: 10),
      child: ListView.builder(
        itemCount: filteredTitleAndIcon.length,
        itemBuilder: (context, index) {
          final config = filteredTitleAndIcon[index];
          final configIndex = titleAndIcon.indexOf(config);
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0XFFF3F3F3),
            ),
            margin: index == filteredTitleAndIcon.length -1 ? EdgeInsets.only(bottom: 80) : EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Icon(config.icon, color: Theme.of(context).primaryColor),
              ),
              title: Text(config.title),
              trailing: DropdownButton<String>(
                value: selectedValues[configIndex],
                onChanged: (newValue) {
                  setState(() {
                    selectedValues[configIndex] = newValue!;
                  });
                },
                items: valueCounts[configIndex].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                menuMaxHeight: 210,
              ),
            ),
          );
        },
      ),
    );
  }
}

class TitleAndIcon {
  final String title;
  final IconData icon;

  TitleAndIcon(this.title, this.icon);
}
