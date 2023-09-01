import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/screens/UserPermission.dart';
import 'package:oro_2024/utils/theme.dart';

import 'AddSubUser.dart';

class Language {
  final int id;
  final String name;
  final String languageCode;

  const Language(this.id, this.name, this.languageCode);
}

class ManageUser extends StatefulWidget {
  const ManageUser({Key? key}) : super(key: key);

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {

  List<Language> getLanguages = <Language>[
    const Language(1, 'Eidt', 'edit'),
    const Language(3, 'Delete', 'delete'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: const Text('Manage User'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.person_add_outlined), onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const AddSubUser()));
          }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 5,
            margin: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.perm_identity_outlined, color: Colors.white,),),
              title: Text('Sub User Name' , style: Theme.of(context).textTheme.bodyLarge,),
              subtitle: Text('His sub title like permission or address', style: Theme.of(context).textTheme.bodyMedium,),
              trailing: DropdownButton(
                underline: const SizedBox(),
                icon: Icon(Icons.more_vert),
                items: getLanguages.map((Language lang) {
                  return DropdownMenuItem<String>(
                    value: lang.languageCode,
                    child: Text(lang.name, style: const TextStyle(color: Colors.black)),
                  );
                }).toList(),
                onChanged: (val) {
                  print(val);
                  if(val=='edit'){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const AddSubUser()));
                  }
                },
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const UserPermission()));
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.perm_identity_outlined, color: Colors.white,),),
              title: Text('Sub User Name' , style: Theme.of(context).textTheme.bodyLarge,),
              subtitle: Text('His sub title like permission or address', style: Theme.of(context).textTheme.bodyMedium,),
              trailing: Icon(Icons.more_vert_rounded, color: myTheme.primaryColor,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const UserPermission()));
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.perm_identity_outlined, color: Colors.white,),),
              title: Text('Sub User Name' , style: Theme.of(context).textTheme.bodyLarge,),
              subtitle: Text('His sub title like permission or address', style: Theme.of(context).textTheme.bodyMedium,),
              trailing: Icon(Icons.more_vert_rounded, color: myTheme.primaryColor,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const UserPermission()));
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.perm_identity_outlined, color: Colors.white,),),
              title: Text('Sub User Name' , style: Theme.of(context).textTheme.bodyLarge,),
              subtitle: Text('His sub title like permission or address', style: Theme.of(context).textTheme.bodyMedium,),
              trailing: Icon(Icons.more_vert_rounded, color: myTheme.primaryColor,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const UserPermission()));
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.perm_identity_outlined, color: Colors.white,),),
              title: Text('Sub User Name' , style: Theme.of(context).textTheme.bodyLarge,),
              subtitle: Text('His sub title like permission or address', style: Theme.of(context).textTheme.bodyMedium,),
              trailing: Icon(Icons.more_vert_rounded, color: myTheme.primaryColor,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const UserPermission()));
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.perm_identity_outlined, color: Colors.white,),),
              title: Text('Sub User Name' , style: Theme.of(context).textTheme.bodyLarge,),
              subtitle: Text('His sub title like permission or address', style: Theme.of(context).textTheme.bodyMedium,),
              trailing: Icon(Icons.more_vert_rounded, color: myTheme.primaryColor,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const UserPermission()));
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.perm_identity_outlined, color: Colors.white,),),
              title: Text('Sub User Name' , style: Theme.of(context).textTheme.bodyLarge,),
              subtitle: Text('His sub title like permission or address', style: Theme.of(context).textTheme.bodyMedium,),
              trailing: Icon(Icons.more_vert_rounded, color: myTheme.primaryColor,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const UserPermission()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
