import 'package:flutter/material.dart';
import 'package:oro_2024/screens/AlarmList.dart';
import 'package:oro_2024/screens/AppInfo.dart';
import 'package:oro_2024/screens/Service_request.dart';
import 'package:oro_2024/screens/SharedDevice.dart';
import 'package:oro_2024/screens/customer_device.dart';
import 'package:oro_2024/screens/sell_device.dart';
import 'package:oro_2024/theme/Theme.dart';

import 'Dashboard.dart';
import 'MyPrefrence.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//this is state widget
class _HomeScreenState extends State<HomeScreen> {

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
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SellDeviceScreen(purpose: '', title: '');
                      }));
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                    leading: const Icon(Icons.list),
                    title: const Text('My Customers'),
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
      // drawer: Drawer(
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.zero
      //   ),
      //   child: CustomScrollView(
      //     slivers: [
      //       SliverList(
      //         delegate: SliverChildListDelegate(
      //           [
      //             Container(
      //               width: double.infinity,
      //               height: 230,
      //               color: Theme.of(context).primaryColor,
      //               child: Column(
      //                 children: <Widget>[
      //                   const Padding(padding: EdgeInsets.all(15.0),),
      //                   const Center(
      //                     child: CircleAvatar(
      //                       backgroundColor: Colors.white,
      //                       radius: 50,
      //                       child: ClipOval(
      //                         //child: Image.asset('assets/images/defalt_user.jpeg'),
      //                       ),
      //                     ), //CircleAvatar
      //                   ),
      //                   Center(
      //                     child: ListTile(
      //                       title: Center(child: Text("Customer Name", style: Theme.of(context).textTheme.headlineSmall,)),
      //                       subtitle: Center(child: Text("+91 9698852733 \n naiagara@gmail.com", style: Theme.of(context).textTheme.bodyLarge,)),
      //                     ), //CircleAvatar
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             ListView.builder(
      //               physics: const NeverScrollableScrollPhysics(),
      //               shrinkWrap: true,
      //               itemCount: 9,
      //               itemBuilder: (BuildContext context, int index)
      //               {
      //                 if(index==0){
      //                   return Container(
      //                     padding: const EdgeInsets.only(bottom: 05),
      //                     child: ListTile(
      //                       leading: const CircleAvatar(child: Icon(Icons.settings_outlined, color: Colors.white,)),
      //                       title: Text('My Preference', style: Theme.of(context).textTheme.bodyLarge,),
      //                       subtitle: Text('Languages, Notification, Change mobile number and email...', style: Theme.of(context).textTheme.bodySmall,),
      //                       onTap: () {
      //                         Navigator.of(context).pop();
      //                         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
      //                       },
      //                     ),
      //                   );
      //                 }
      //                 else if(index==1){
      //                   return Container(
      //                     padding: const EdgeInsets.only(bottom: 05),
      //                     child: ListTile(
      //                       leading: CircleAvatar(child: Icon(Icons.group_outlined, color: Colors.white,)),
      //                       title: Text('Manage User', style: Theme.of(context).textTheme.bodyLarge,),
      //                       subtitle: Text('User subscription, Add, Edit, Delete user, ...', style: Theme.of(context).textTheme.bodySmall,),
      //                       onTap: () {
      //                         //Navigator.of(context).pop();
      //                         //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
      //                       },
      //                     ),
      //                   );
      //                 }
      //                 else if(index==2){
      //                   return Container(
      //                     padding: const EdgeInsets.only(bottom: 05),
      //                     child: ListTile(
      //                       leading: CircleAvatar(child: Icon(Icons.help_outline, color: Colors.white,)),
      //                       title: Text('Help & Support', style: Theme.of(context).textTheme.bodyLarge,),
      //                       subtitle: Text('Clear instructions, Tutorial, Live chat, Email support...', style: Theme.of(context).textTheme.bodySmall,),
      //                       onTap: () {
      //                         //Navigator.of(context).pop();
      //                         //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
      //                       },
      //                     ),
      //                   );
      //                 }
      //                 else if(index==3){
      //                   return Container(
      //                     padding: const EdgeInsets.only(bottom: 5),
      //                     child: ListTile(
      //                       leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
      //                       title: Text('App Info', style: Theme.of(context).textTheme.bodyLarge,),
      //                       subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
      //                       onTap: () {
      //                         Navigator.of(context).pop();
      //                         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const AppInfo()));
      //                       },
      //                     ),
      //                   );
      //                 }
      //                 else if(index==4){
      //                   return Container(
      //                     padding: const EdgeInsets.only(bottom: 5),
      //                     child: ListTile(
      //                       leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
      //                       title: Text('Service Request', style: Theme.of(context).textTheme.bodyLarge,),
      //                       subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
      //                       onTap: () {
      //                         Navigator.of(context).pop();
      //                         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Service_request()));
      //                       },
      //                     ),
      //                   );
      //                 }
      //                 else if(index==5){
      //                   return Container(
      //                     padding: const EdgeInsets.only(bottom: 5),
      //                     child: ListTile(
      //                       leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
      //                       title: Text('Sell To Controller', style: Theme.of(context).textTheme.bodyLarge,),
      //                       subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
      //                       onTap: () {
      //                         //Navigator.of(context).pop();
      //                         //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
      //                       },
      //                     ),
      //                   );
      //                 }
      //                 else if(index==6){
      //                   return Container(
      //                     padding: const EdgeInsets.only(bottom: 5),
      //                     child: ListTile(
      //                       leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
      //                       title: Text('Customer Device', style: Theme.of(context).textTheme.bodyLarge,),
      //                       subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
      //                       onTap: () {
      //                         //Navigator.of(context).pop();
      //                         //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
      //                       },
      //                     ),
      //                   );
      //                 }
      //                 else if(index==7){
      //                   return Container(
      //                     padding: const EdgeInsets.only(bottom: 5),
      //                     child: ListTile(
      //                       leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
      //                       title: Text('Shared Device', style: Theme.of(context).textTheme.bodyLarge,),
      //                       subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
      //                       onTap: () {
      //                         //Navigator.of(context).pop();
      //                         //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
      //                       },
      //                     ),
      //                   );
      //                 }
      //                 else if(index==8){
      //                   return Container(
      //                     padding: const EdgeInsets.only(bottom: 5),
      //                     child: ListTile(
      //                       leading: CircleAvatar(child: Icon(Icons.info_outline, color: Colors.white,)),
      //                       title: Text('Replace', style: Theme.of(context).textTheme.bodyLarge,),
      //                       subtitle: Text('App version, Privacy Policy, Terms of Service...', style: Theme.of(context).textTheme.bodySmall,),
      //                       onTap: () {
      //                         //Navigator.of(context).pop();
      //                         //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
      //                       },
      //                     ),
      //                   );
      //                 }
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //       SliverFillRemaining(
      //         hasScrollBody: false,
      //         child: Align(
      //           alignment: Alignment.bottomCenter,
      //           child: Container(
      //             width: double.infinity,
      //             height: 50,
      //             color: Theme.of(context).primaryColor,
      //             child: const ListTile(
      //               trailing: Icon(Icons.logout, color: Colors.white,),
      //               title: Text('Logout', style: TextStyle(fontSize: 18, color: Colors.white),),
      //             ),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      //
      // ),
      body: Card(
        margin: const EdgeInsets.all(20),
        child: InkWell(
          onTap: () {
            print("tapped");
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Dashboard()));
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
