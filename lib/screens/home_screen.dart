import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/screens/AlarmList.dart';
import 'package:oro_2024/screens/AppInfo.dart';
import 'package:oro_2024/screens/Service_request.dart';
import 'package:oro_2024/screens/SharedDevice.dart';
import 'package:oro_2024/screens/customer_device.dart';
import 'package:oro_2024/screens/my_stepper.dart';
import 'package:oro_2024/screens/sell_device.dart';
import 'package:oro_2024/screens/sell_device_stepper.dart';
import 'package:oro_2024/theme/Theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Dashboard.dart';
import 'MyPrefrence.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//this is state widget
class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  Map<String, String> devicePriceList(int index){
    switch(index){
      case 0: {
        return {
          'image' : 'assets/images/controller.png',
          'name' : 'controller',
          'price' : '#######'
        };
      }
      case 1: {
        return {
          'image' : 'assets/images/float-switch-1.jpg',
          'name' : 'Float Switch',
          'price' : '#######'
        };
      }
      case 2: {
        return {
          'image' : 'assets/images/pipelinealarm-1.jpg',
          'name' : 'Pipe Line Alarm',
          'price' : '#######'
        };
      }
      case 3: {
        return {
          'image' : 'assets/images/solenoid-valve-2.jpg',
          'name' : 'Solenoid Valve',
          'price' : '#######'
        };
      }
      default: {
        return {}; // You might want to handle cases where index is out of range.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF3F3F3),
      appBar: AppBar(
        title: const Text('Home',),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.add_alert_sharp), onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const AlarmList()));
          }),
        ],
      ),
      drawer: SizedBox(
        width: 320,
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                        color: liteBlue,
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black12))
                    ), //BoxDecoration
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black12,
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            Text('Sivaprakash')
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Icon(Icons.mail, color: Colors.black,),
                            SizedBox(width: 10.0,),
                            Text('sivaprakash.niagara@gmail.com', style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal,),),
                          ],
                        ),
                        SizedBox(height: 5.0,),
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.black),
                            SizedBox(width: 10.0,),
                            Text('8220676342', style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),),
                          ],
                        ),
                      ],
                    ),//UserAccountDrawerHeader
                  ), //DrawerHeader
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                    leading: const Icon(Icons.sell),
                    title: const Text('Sell Device'),
                    subtitle: Text('Selection, Sell & Create Account', style: TextStyle(fontSize: 12),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SellDeviceScreen(purpose: '', title: '');
                      }));
                      // Navigator.push(context, MaterialPageRoute(builder: (context){
                      //   return MyStepper();
                      // }));
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                    leading: const Icon(Icons.list),
                    title: const Text('My Customers'),
                    subtitle: Text('Rating, Products & Replace', style: TextStyle(fontSize: 12),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CustomerDevice(purpose: '');
                      }));
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                    leading: const Icon(Icons.miscellaneous_services),
                    title: const Text('Service Request'),
                    subtitle: Text('Open, In Progress, Close, Reason', style: TextStyle(fontSize: 12),),
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ServiceRequest();
                      }));
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                    leading: const Icon(Icons.video_label),
                    title: const Text(' Shared Device '),
                    subtitle: Text('Sub Users', style: TextStyle(fontSize: 12),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SharedDevice();
                      }));
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                    leading: const Icon(Icons.edit),
                    title: const Text(' Edit Profile '),
                    subtitle: Text('Add, Edit & Delete User', style: TextStyle(fontSize: 12),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                    leading: const Icon(Icons.logout),
                    title: const Text('LogOut'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(width: 0.5))
                ),
                child: Center(child: Text('Terms & Condition | Privacy Policy', style: TextStyle(fontSize: 12),)),
              ),

            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0,),
            Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                // color: Color(0XFFF3F3F3)
                color: Colors.white
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Center(
                    child: Text('Sales Status', style: TextStyle(fontSize: 18),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LineChartSample2(),
                  ),
                ],
              )
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white
              ),
              child: GridView.builder(
                itemCount: 10,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                    childAspectRatio: 3/2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
              ), itemBuilder: (BuildContext context, int index){
                    return Container(
                      decoration: BoxDecoration(
                        color: liteBlue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.event),
                          Text('Event')
                        ],
                      ),
                    );
              }),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: 4,
                        itemBuilder: (context, int index){
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: EdgeInsets.all(10.0),
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                width: 300,
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.5),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(devicePriceList(index)['image']!)
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0XFFF3F3F3),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                width: 230,
                                height: 60,
                                child: Column(
                                  children: [
                                    Text(devicePriceList(index)['name']!),
                                    Text('Price : ${devicePriceList(index)['price']!}')
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0XFFF3F3F3),
                                ),
                              ),
                              bottom: 0,
                              left: 35,
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10.0,bottom: 10),
                    width: double.infinity,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: const WormEffect(
                        dotHeight: 16,
                        dotWidth: 16,
                        type: WormType.normal,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    liteYellow,
    Color(0XFFFFB506)
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ),
        ),
        Container(
          color: showAvg ? PrimaryColor : Colors.black12,
          width: 50,
          height: 34,
          child: Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  showAvg = !showAvg;
                });
              },
              child: Text(
                'avg',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.yellow,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.black12,
            strokeWidth: 1,
          );
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
