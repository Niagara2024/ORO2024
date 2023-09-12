class MyAssets {
  final String valve;
  final String mainValve;
  final String mainFilterValve;
  final String sourcePump;
  final String irrigationPump;
  final String filter;
  final String fertilizers;
  final String dosingChannel;
  final String dosingBooster;
  final String selector;
  final String agitator;
  final String weatherStations;
  final String rtu;
  final String xtend;
  final String sense;
  final String level;
  final String switches;
  final String virtualWaterMeter;
  final String conditions;
  final String alarmGroups;
  final String radiationSets;
  final String freeWaterMeters;
  final String satellites;
  final String analogSensors;
  final String contacts;
  final String sites;
  final String cooling;
  final String waterHeater;
  final String ecOpen;
  final String ecClose;
  final String ecPump;
  final String sameAsRelay;

  MyAssets({
    required this.valve,
    required this.mainValve,
    required this.mainFilterValve,
    required this.sourcePump,
    required this.irrigationPump,
    required this.filter,
    required this.fertilizers,
    required this.dosingChannel,
    required this.dosingBooster,
    required this.selector,
    required this.agitator,
    required this.weatherStations,
    required this.rtu,
    required this.xtend,
    required this.sense,
    required this.level,
    required this.switches,
    required this.virtualWaterMeter,
    required this.conditions,
    required this.alarmGroups,
    required this.radiationSets,
    required this.freeWaterMeters,
    required this.satellites,
    required this.analogSensors,
    required this.contacts,
    required this.sites,
    required this.cooling,
    required this.waterHeater,
    required this.ecOpen,
    required this.ecClose,
    required this.ecPump,
    required this.sameAsRelay,
  });

  // Factory constructor to create MyAssets from a map
  factory MyAssets.fromMap(Map<String, dynamic> map) {
    return MyAssets(
      valve: map['valve'] as String,
      mainValve: map['mainValve'] as String,
      mainFilterValve: map['mainFilterValve'] as String,
      sourcePump: map['sourcePump'] as String,
      irrigationPump: map['irrigationPump'] as String,
      filter: map['filter'] as String,
      fertilizers: map['fertilizers'] as String,
      dosingChannel: map['dosingChannel'] as String,
      dosingBooster: map['dosingBooster'] as String,
      selector: map['selector'] as String,
      agitator: map['agitator'] as String,
      weatherStations: map['weatherStations'] as String,
      rtu: map['rtu'] as String,
      xtend: map['xtend'] as String,
      sense: map['sense'] as String,
      level: map['sense'] as String,
      switches: map['switches'] as String,
      virtualWaterMeter: map['virtualWaterMeter'] as String,
      conditions: map['conditions'] as String,
      alarmGroups: map['alarmGroups'] as String,
      radiationSets: map['radiationSets'] as String,
      freeWaterMeters: map['freeWaterMeters'] as String,
      satellites: map['satellites'] as String,
      analogSensors: map['analogSensors'] as String,
      contacts: map['contacts'] as String,
      sites: map['sites'] as String,
      cooling: map['cooling'] as String,
      waterHeater: map['waterHeater'] as String,
      ecOpen: map['ecOpen'] as String,
      ecClose: map['ecClose'] as String,
      ecPump: map['ecPump'] as String,
      sameAsRelay: map['sameAsRelay'] as String,
    );
  }
}
