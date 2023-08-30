import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/utils/theme.dart';

class AddSubUser extends StatefulWidget {
  const AddSubUser({Key? key}) : super(key: key);

  @override
  State<AddSubUser> createState() => _AddSubUserState();
}

class _AddSubUserState extends State<AddSubUser> {

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: CircleAvatar(
              backgroundColor: myTheme.primaryColor,
              radius: 50,
              child: ClipOval(
                //child: Image.asset('assets/images/defalt_user.jpeg'),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: myTheme.primaryColor,),
                  border: const UnderlineInputBorder(),
                  labelText: 'Enter your Username',
                  suffixIcon: Icon(Icons.clear, color: Colors.red,),
                ),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mobile_friendly, color: myTheme.primaryColor,),
                  border: const UnderlineInputBorder(),
                  labelText: 'Enter user Mobile Number',
                  suffixIcon: Icon(Icons.clear, color: Colors.red,),
                ),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: myTheme.primaryColor,),
                  border: const UnderlineInputBorder(),
                  labelText: 'Enter user Email address',
                  suffixIcon: Icon(Icons.clear, color: Colors.red,),
                ),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text('We will send you an OPT(One Time password) to the entered customer mobile number' , style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
            ),
          ),
          ListTile(
            title: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: myTheme.primaryColor, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () { },
              child: Text('VERIFY USER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text('Phone Number Verification'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpInput(_fieldOne, false), // auto focus
                  OtpInput(_fieldTwo, false),
                  OtpInput(_fieldThree, false),
                  OtpInput(_fieldFour, false),
                  OtpInput(_fieldFive, false),
                  OtpInput(_fieldSix, false),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          ListTile(
            title: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: myTheme.primaryColor, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () { },
              child: const Text('VERIFY OTP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            ),
          ),
        ],
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 40,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}