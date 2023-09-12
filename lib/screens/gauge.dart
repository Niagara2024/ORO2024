import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/theme/Theme.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

/// Represents the GaugeApp class
class GaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radial Gauge Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

/// Represents MyHomePage class
class MyHomePage extends StatefulWidget {
  /// Creates the instance of MyHomePage
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width/2,
          height: 200,
          child: SfRadialGauge(
              title: GaugeTitle(
                  text: 'Pump 1',
                  textStyle:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              axes: <RadialAxis>[
                RadialAxis(minimum: 0, maximum: 12, ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0,
                      endValue: 4,
                      color: Colors.green,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 4,
                      endValue: 8,
                      color: Colors.orange,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 8,
                      // sizeUnit: GaugeSizeUnit.logicalPixel,
                      endValue: 12,
                      color: Colors.red,
                      startWidth: 10,
                      endWidth: 10)
                ], pointers: <GaugePointer>[
                  NeedlePointer(value: 5)
                ], annotations: <GaugeAnnotation>[
                  // GaugeAnnotation(
                  //     widget: Container(
                  //         child: const Text('90.0',
                  //             style: TextStyle(
                  //                 fontSize: 25, fontWeight: FontWeight.bold))),
                  //     angle: 90,
                  //     positionFactor: 0.5)
                ])
              ]),
        ),
        Container(
          alignment: Alignment.center,
          color: liteBlue,
          height: 200,
          width: MediaQuery.of(context).size.width/2,
            child: BarChartSample1()
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width/2,
        //   height: 200,
        //   child: SfRadialGauge(
        //       title: GaugeTitle(
        //           text: 'Pump 2',
        //           textStyle:
        //           const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        //       axes: <RadialAxis>[
        //         RadialAxis(minimum: 0, maximum: 12, ranges: <GaugeRange>[
        //           GaugeRange(
        //               startValue: 0,
        //               endValue: 4,
        //               color: Colors.green,
        //               startWidth: 10,
        //               endWidth: 10),
        //           GaugeRange(
        //               startValue: 4,
        //               endValue: 8,
        //               color: Colors.orange,
        //               startWidth: 10,
        //               endWidth: 10),
        //           GaugeRange(
        //               startValue: 8,
        //               // sizeUnit: GaugeSizeUnit.logicalPixel,
        //               endValue: 12,
        //               color: Colors.red,
        //               startWidth: 10,
        //               endWidth: 10)
        //         ], pointers: <GaugePointer>[
        //           NeedlePointer(value: 5)
        //         ], annotations: <GaugeAnnotation>[
        //           // GaugeAnnotation(
        //           //     widget: Container(
        //           //         child: const Text('90.0',
        //           //             style: TextStyle(
        //           //                 fontSize: 25, fontWeight: FontWeight.bold))),
        //           //     angle: 90,
        //           //     positionFactor: 0.5)
        //         ])
        //       ]),
        // ),
      ],
    );
  }

  Widget _getLinearGauge() {
    return Container(
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: LinearTickStyle(length: 20),
          axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
      margin: EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Syncfusion Flutter Gauge')),
        body: _getGauge());
  }
}
class BarChartSample1 extends StatefulWidget {
  BarChartSample1({super.key});

  List<Color> get availableColors => const <Color>[
    Colors.red,
    Colors.yellow,
    Colors.blue
  ];

  // final Color barBackgroundColor =
  // AppColors.contentColorWhite.darken().withOpacity(0.3);
  // final Color barColor = AppColors.contentColorWhite;
  // final Color touchedBarColor = AppColors.contentColorGreen;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // const Text(
                //   'Mingguan',
                //   style: TextStyle(
                //     color: Colors.red,
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(
                //   height: 4,
                // ),
                // Text(
                //   'Grafik konsumsi kalori',
                //   style: TextStyle(
                //     color: Colors.red,
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(
                //   height: 38,
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BarChart(
                      // mainBarData(),
                      // randomData(),
                      isPlaying ? randomData() : mainBarData(),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.green,
                ),
                onPressed: () {
                  setState(() {
                    isPlaying = !isPlaying;
                    if (isPlaying) {
                      refreshState();
                    }
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      Color whatColor,
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    // barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: whatColor,
          // color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          // borderSide: isTouched
          //     ? BorderSide(color: widget.touchedBarColor.darken(80))
          //     : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            // color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(3, (i) {
    switch (i) {
      case 0:
        print(touchedIndex);
        return makeGroupData(Colors.red,0, 10, isTouched: i == touchedIndex);
      case 1:
        print(touchedIndex);
        return makeGroupData(Colors.yellow,1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(Colors.blue, 2, 5, isTouched: i == touchedIndex);
      // case 3:
      //   return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
      // case 4:
      //   return makeGroupData(4, 9, isTouched: i == touchedIndex);
      // case 5:
      //   return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
      // case 6:
      //   return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    // color: widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('R', style: TextStyle(color: Colors.black));
        break;
      case 1:
        text = const Text('Y', style: TextStyle(color: Colors.black));
        break;
      case 2:
        text = const Text('B', style: TextStyle(color: Colors.black));
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(3, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              Colors.red,
              0,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 1:
            return makeGroupData(
              Colors.yellow,
              1,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 2:
            return makeGroupData(
              Colors.blue,
              2,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          // case 3:
          //   return makeGroupData(
          //     3,
          //     Random().nextInt(15).toDouble() + 6,
          //     barColor: widget.availableColors[
          //     Random().nextInt(widget.availableColors.length)],
          //   );
          // case 4:
          //   return makeGroupData(
          //     4,
          //     Random().nextInt(15).toDouble() + 6,
          //     barColor: widget.availableColors[
          //     Random().nextInt(widget.availableColors.length)],
          //   );
          // case 5:
          //   return makeGroupData(
          //     5,
          //     Random().nextInt(15).toDouble() + 6,
          //     barColor: widget.availableColors[
          //     Random().nextInt(widget.availableColors.length)],
          //   );
          // case 6:
          //   return makeGroupData(
          //     6,
          //     Random().nextInt(15).toDouble() + 6,
          //     barColor: widget.availableColors[
          //     Random().nextInt(widget.availableColors.length)],
          //   );
          default:
            return throw Error();
        }
      }),
      gridData: const FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}