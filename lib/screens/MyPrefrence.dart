import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Language {
  final int id;
  final String name;
  final String languageCode;

  const Language(this.id, this.name, this.languageCode);
}


class MyPreference extends StatefulWidget {
  const MyPreference({Key? key}) : super(key: key);

  @override
  State<MyPreference> createState() => _MyPreferenceState();
}

class _MyPreferenceState extends State<MyPreference> {

  List<Language> getLanguages = <Language>[
    const Language(1, 'English', 'en'),
    const Language(3, 'हिंदी', 'hi'),
    const Language(3, 'தமிழ்', 'tm'),
    const Language(2, 'فارسی', 'fa'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Preference'),
        elevation: 2,
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            secondary: const CircleAvatar(child: Icon(Icons.notifications_none, color: Colors.white,),),
            value: false,
            title: const Text("Notification"),
            onChanged: (value) {},
          ),
          SwitchListTile(
            secondary: const CircleAvatar(child: Icon(Icons.volume_down,color: Colors.white,),),
            value: false,
            title: const Text("Notification Sound"),
            onChanged: (value) {},
          ),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.language, color: Colors.white,),),
            title: const Text('Change Language'),
            trailing: DropdownButton(
              underline: const SizedBox(),
              hint: const Text('English'),
              items: getLanguages.map((Language lang) {
                return DropdownMenuItem<String>(
                  value: lang.languageCode,
                  child: Text(lang.name, style: const TextStyle(color: Colors.black)),
                );
              }).toList(),

              onChanged: (val) {
                print(val);
              },
            ),
          ),
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.change_circle_outlined,color: Colors.white,),),
            title: Text('Change Mobile Number'),
            subtitle: Text('+91 9698852733'),
          ),
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.alternate_email,color: Colors.white,),),
            title: Text('Change Email address'),
            subtitle: Text('niagara@gmail.com'),
          ),
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.alternate_email,color: Colors.white,),),
            title: Text('Theme (Light/Dark)'),
            trailing: Text('Light'),
          ),
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.alternate_email,color: Colors.white,),),
            title: Text('Font Size'),
            trailing: Text('100%'),
          ),
        ],
      ),
    );
  }
}
