import 'package:flutter/material.dart';
import 'package:oro_2024/screens/AlarmList.dart';
import 'package:oro_2024/screens/AppInfo.dart';
import 'package:oro_2024/screens/ControllerLive.dart';
import 'package:oro_2024/screens/HelpAndSupport.dart';
import 'package:oro_2024/screens/ManageUser.dart';
import 'package:oro_2024/screens/Service_request.dart';
import 'package:oro_2024/screens/customer_device.dart';
import 'package:oro_2024/screens/sell_device.dart';
import 'package:oro_2024/utils/theme.dart';

import 'Dashboard.dart';
import 'MyPrefrence.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//this is state widget
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.add_alert_sharp), onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const AlarmList()));
          }),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    width: double.infinity,
                    height: 230,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.all(15.0),),
                        const Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50,
                            child: ClipOval(
                              //child: Image.asset('assets/images/defalt_user.jpeg'),
                            ),
                          ), //CircleAvatar
                        ),
                        Center(
                          child: ListTile(
                            title: Center(child: Text("Customer Name", style: Theme.of(context).textTheme.headlineSmall,)),
                            subtitle: Center(child: Text("+91 9698852733 \n naiagara@gmail.com", style: Theme.of(context).textTheme.bodyLarge,)),
                          ), //CircleAvatar
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index)
                    {
                      if(index==0){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 05),
                          child: ListTile(
                            leading: const CircleAvatar(child: Icon(Icons.settings_outlined, color: Colors.white,)),
                            title: Text('My Preference', style: Theme.of(context).textTheme.bodyLarge,),
                            subtitle: Text('Languages, Notification, Change mobile number and email...', style: Theme.of(context).textTheme.bodySmall,),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
                            },
                          ),
                        );
                      }
                      else if(index==1){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 05),
                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.group_outlined, color: Colors.white,)),
                            title: Text('Manage User', style: Theme.of(context).textTheme.bodyLarge,),
                            subtitle: Text('User subscription, Add, Edit, Delete user, ...', style: Theme.of(context).textTheme.bodySmall,),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const ManageUser()));
                            },
                          ),
                        );
                      }
                      else if(index==2){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 05),
                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.help_outline, color: Colors.white,)),
                            title: Text('Help & Support', style: Theme.of(context).textTheme.bodyLarge,),
                            subtitle: Text('Clear instructions, Tutorial, Privacy Policy, Terms of Service', style: Theme.of(context).textTheme.bodySmall,),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const HelpAndSupport()));
                            },
                          ),
                        );
                      }
                      else if(index==3){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
                            title: Text('App Info', style: Theme.of(context).textTheme.bodyLarge,),
                            subtitle: Text('App Name, Version, Last update, Features...', style: Theme.of(context).textTheme.bodySmall,),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const AppInfo()));
                            },
                          ),
                        );
                      }
                      else if(index==4){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
                            title: Text('Service Request', style: Theme.of(context).textTheme.bodyLarge,),
                            subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ServiceRequest()));
                            },
                          ),
                        );
                      }
                      else if(index==5){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
                            title: Text('My Assets', style: Theme.of(context).textTheme.bodyLarge,),
                            subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  SellDeviceScreen(purpose: '', title: '')));
                            },
                          ),
                        );
                      }
                      else if(index==6){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
                            title: Text('Customer Device', style: Theme.of(context).textTheme.bodyLarge,),
                            subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const CustomerDevice(purpose: '')));
                            },
                          ),
                        );
                      }
                      else if(index==7){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
                            title: Text('Shared Device', style: Theme.of(context).textTheme.bodyLarge,),
                            subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
                            onTap: () {
                              //Navigator.of(context).pop();
                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
                            },
                          ),
                        );
                      }
                      else if(index==8){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
                            title: Text('Replace', style: Theme.of(context).textTheme.bodyLarge,),
                            subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
                            onTap: () {
                              //Navigator.of(context).pop();
                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Theme.of(context).primaryColor,
                  child: const ListTile(
                    trailing: Icon(Icons.logout, color: Colors.white,),
                    title: Text('Logout', style: TextStyle(fontSize: 18, color: Colors.white),),
                  ),
                ),
              ),
            )
          ],
        ),

      ),
      body: Scaffold(
        backgroundColor: myTheme.primaryColor.withOpacity(0.12),
          body: Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const ControllerDashboardScreen3()));
              },
              child: Container(
                height: 550,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.desktop_mac, color: Colors.white,),),
                        title: Text('Name : ORO GEM', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                        subtitle: Text("IMEI No : 1234568754213"),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const ControllerLive()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          color: Colors.green.shade50,
                          height: 85,
                          child: ListTile(
                            title: Text("Version   :   EC25Fc2.0\nM-Date   :   11-08-23\nSim No    :   +91 737895468"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text("Irrigation", style: TextStyle(fontWeight: FontWeight.bold),),
                              new Text("Running/idle/error")
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text("Fertilization", style: TextStyle(fontWeight: FontWeight.bold),),
                              new Text("Running/idle/error")
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text("Backwash", style: TextStyle(fontWeight: FontWeight.bold),),
                              new Text("Running/idle/error")
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                        child: Container(
                          color: myTheme.primaryColor.withOpacity(0.22),
                          height: 118,
                          child: SafeArea(
                            child: SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: GridView(
                                scrollDirection: Axis.horizontal,
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 118,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 0),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: ListView(
                                        children: [
                                          SizedBox(height: 5,),
                                          Center(
                                            child: CircleAvatar(
                                              backgroundColor: myTheme.primaryColor.withOpacity(0.42),
                                              radius: 30,
                                              child: ClipOval(
                                                child: Image.asset('assets/images/report.png',width: 50, height: 50,),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text("Report"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: ListView(
                                        children: [
                                          SizedBox(height: 5,),
                                          Center(
                                            child: CircleAvatar(
                                              backgroundColor: myTheme.primaryColor.withOpacity(0.42),
                                              radius: 30,
                                              child: ClipOval(
                                                child: Image.asset('assets/images/usage.png',width: 50, height: 50,),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(" Power Graph ", textAlign: TextAlign.center,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: ListView(
                                        children: [
                                          SizedBox(height: 5,),
                                          Center(
                                            child: CircleAvatar(
                                              backgroundColor: myTheme.primaryColor.withOpacity(0.42),
                                              radius: 30,
                                              child: ClipOval(
                                                child: Image.asset('assets/images/checklist.png',width: 50, height: 50,),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text("Motor cyclic", textAlign: TextAlign.center,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: ListView(
                                        children: [
                                          SizedBox(height: 5,),
                                          Center(
                                            child: CircleAvatar(
                                              backgroundColor: myTheme.primaryColor.withOpacity(0.42),
                                              radius: 30,
                                              child: ClipOval(
                                                child: Image.asset('assets/images/report.png',width: 50, height: 50,),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text("Zone duration", textAlign: TextAlign.center,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                        child: Container(
                          color: myTheme.primaryColor.withOpacity(0.12),
                          height: 150,
                          child: SafeArea(
                            child: SizedBox(
                              width: double.infinity,
                              height: 150,
                              child: ListView(
                                children: <Widget>[
                                  new Container(
                                    decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
                                    child: new TabBar(
                                      controller: _controller,
                                      tabs: [
                                        new Tab(
                                          text: 'Temperature',
                                        ),
                                        new Tab(
                                          text: 'Humidity',
                                        ),
                                        new Tab(
                                          text: 'Moisture',
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Container(
                                    height: 100.0,
                                    child: new TabBarView(
                                      controller: _controller,
                                      children: <Widget>[
                                        new Card(
                                          elevation: 0,
                                          child: new ListTile(
                                            leading: const Icon(Icons.location_on),
                                            title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                                            trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
                                          ),
                                        ),
                                        new Card(
                                          elevation: 0,
                                          child: new ListTile(
                                            leading: const Icon(Icons.location_on),
                                            title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                                            trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
                                          ),
                                        ),
                                        new Card(
                                          elevation: 0,
                                          child: new ListTile(
                                            leading: const Icon(Icons.location_on),
                                            title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                                            trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
            ),
          ),
        ),
    );
  }
}
