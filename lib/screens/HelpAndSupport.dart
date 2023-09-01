import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/utils/theme.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Help & Support'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.integration_instructions_outlined), child: Text('Instruction')),
              Tab(icon: Icon(Icons.video_collection_outlined), child: Text('Tutorial'))
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            ListView(
              children: const [
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome to ORO smart Drip irrigation, The smart solution for controlling and monitoring your irrigation system. Whether you are managing a small garden or a large agricultural field, our app empowers you to optimize water usage and keep your plants thriving.',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Features :', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Text.rich(
                    TextSpan(
                      text: '1. Remote Control : ',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Easily manage your irrigation system from anywhere and any time using your smartphone or table.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Text.rich(
                    TextSpan(
                      text: '2. Smart Scheduling : ',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Set up customized watering schedules based on your plants needs, weather conditions, and local regulations.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Text.rich(
                    TextSpan(
                      text: '3. Weather Integration : ',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Our app syncs with real-time weather data to adjust irrigation schedules and conserve water during rainy periods.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Text.rich(
                    TextSpan(
                      text: '4. Usage Analytics : ',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Track your water consumption and receive insights to make informed decisions about your irrigation strategy.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Text.rich(
                    TextSpan(
                      text: '5. Notifications : ',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Receive alerts and notifications about system status, maintenance reminders, and more.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Center(
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        fontSize: 20,
                        color: Colors.blue
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Terms and conditions',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      color: Colors.blue,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
            ListView.separated( //<-- SEE HERE
              itemCount: 4,
              itemBuilder: (context, index) {
                if(index==0){
                  return ListTile(
                    leading: Image.asset('assets/images/youtube.webp', height: 200, width: 100,),
                    title: const Text('How to Create an program', style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('Creating an irrigation program involves setting up a schedule for your irrigation system to water your plants efficiently.'),
                  );
                }else if(index==1){
                  return ListTile(
                    leading: Image.asset('assets/images/youtube.webp', height: 200, width: 100,),
                    title: const Text('Irrigation scheduling', style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('Creating an irrigation program involves setting up a schedule for your irrigation system to water your plants efficiently.'),
                  );
                }else if(index==2){
                  return ListTile(
                    leading: Image.asset('assets/images/youtube.webp', height: 200, width: 100,),
                    title: const Text('Fertilization settings', style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('Creating an irrigation program involves setting up a schedule for your irrigation system to water your plants efficiently.'),
                  );
                }else{
                  return ListTile(
                    leading: Image.asset('assets/images/youtube.webp', height: 200, width: 100,),
                    title: const Text('About Filter settings', style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('Creating an irrigation program involves setting up a schedule for your irrigation system to water your plants efficiently.'),
                  );
                }
              },
              separatorBuilder: (context, index) {//<-- SEE HERE
                return Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Divider(
                    color: myTheme.primaryColor.withOpacity(0.35),
                    thickness: 1.0,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}




