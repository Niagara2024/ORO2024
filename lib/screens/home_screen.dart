import 'package:flutter/material.dart';
import 'package:oro_2024/screens/AlarmList.dart';
import 'package:oro_2024/screens/AppInfo.dart';
import 'package:oro_2024/screens/servicerequstlist_view.dart';

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
        title: const Text(
          'ORO',
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add_alert_sharp),
              onPressed: () async {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const AlarmList()));
              }),
        ],
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                        ),
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
                            title: Center(
                                child: Text(
                              "Customer Name",
                              style: Theme.of(context).textTheme.headlineSmall,
                            )),
                            subtitle: Center(
                                child: Text(
                              "+91 9698852733 \n naiagara@gmail.com",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                          ), //CircleAvatar
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 05),
                          child: ListTile(
                            leading: const CircleAvatar(
                                child: Icon(
                              Icons.settings_outlined,
                              color: Colors.white,
                            )),
                            title: Text(
                              'My Preference',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle: Text(
                              'Languages, Notification, Change mobile number and email...',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const MyPreference()));
                            },
                          ),
                        );
                      } else if (index == 1) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 05),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                              Icons.group_outlined,
                              color: Colors.white,
                            )),
                            title: Text(
                              'Manage User',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle: Text(
                              'User subscription, Add, Edit, Delete user, ...',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            onTap: () {
                              //Navigator.of(context).pop();
                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
                            },
                          ),
                        );
                      } else if (index == 2) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 05),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                              Icons.help_outline,
                              color: Colors.white,
                            )),
                            title: Text(
                              'Help & Support',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle: Text(
                              'Clear instructions, Tutorial, Live chat, Email support...',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            onTap: () {
                              //Navigator.of(context).pop();
                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
                            },
                          ),
                        );
                      } else if (index == 3) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            )),
                            title: Text(
                              'App Info',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle: Text(
                              'App version, Privacy Policy, Terms of Service...',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const AppInfo()));
                            },
                          ),
                        );
                      } else if (index == 4) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            )),
                            title: Text(
                              'Service Request',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle: Text(
                              'App version, Privacy Policy, Terms of Service...',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            onTap: () {
                              //Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ServiceRequestlistView()));
                            },
                          ),
                        );
                      } else if (index == 5) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            )),
                            title: Text(
                              'Sell To Controller',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle: Text(
                              'App version, Privacy Policy, Terms of Service...',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            onTap: () {
                              //Navigator.of(context).pop();
                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
                            },
                          ),
                        );
                      } else if (index == 6) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            )),
                            title: Text(
                              'Customer Device',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle: Text(
                              'App version, Privacy Policy, Terms of Service...',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            onTap: () {
                              //Navigator.of(context).pop();
                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
                            },
                          ),
                        );
                      } else if (index == 7) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            )),
                            title: Text(
                              'Shared Device',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle: Text(
                              'App version, Privacy Policy, Terms of Service...',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            onTap: () {
                              //Navigator.of(context).pop();
                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyPreference()));
                            },
                          ),
                        );
                      } else if (index == 8) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            )),
                            title: Text(
                              'Replace',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle: Text(
                              'App version, Privacy Policy, Terms of Service...',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
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
                    trailing: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: const Center(
        child: Text('ORO DRIP IRRIGATION'),
      ),
    );
  }
}
