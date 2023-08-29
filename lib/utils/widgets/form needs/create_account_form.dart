import 'package:bouncing_button/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:oro_2024/screens/customer_device.dart';
import 'package:oro_2024/utils/widgets/form%20needs/text_input_with_heading.dart';
import 'package:provider/provider.dart';
import '../../../state_management/create_account_provide.dart';
import '../../my_theme.dart';
import 'drop_down_button.dart';
import 'inputHeading.dart';

class CreateAccount extends StatefulWidget {
  List<String> list;
  String dropDowm_initial_value;
  CreateAccount({super.key,required this.list, required this.dropDowm_initial_value});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController numberTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _initialCountryCode = '';
  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();
  final FocusNode _fourthFocusNode = FocusNode();
  final FocusNode _fifthFocusNode = FocusNode();
  final FocusNode _sixthFocusNode = FocusNode();
  final FocusNode _seventhFocusNode = FocusNode();

  Future<void> _getLocationAndSetCountryCode() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String? countryCode = placemarks.isNotEmpty ? placemarks.first.isoCountryCode : 'IN';

      setState(() {
        _initialCountryCode = countryCode!;
        print('countryCode  ${countryCode}');
        print(placemarks);
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void initState() {
    numberTextController.addListener(() {
      print('Text changed: ${numberTextController.text}');
    });
    _getLocationAndSetCountryCode();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up resources like controllers and focus nodes
    numberTextController.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    _fifthFocusNode.dispose();
    _sixthFocusNode.dispose();
    _seventhFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var createAccPvd = Provider.of<CreateActProvider>(context,listen : true);
    print('fdvdfv${_initialCountryCode}');
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.arrow_back, size: 25,),
                SizedBox(width: 10,),
                Text('Create Account', style: Text20,),
              ],
            ),
            SizedBox(height: 20,),
            Center(child: Text('Fill customer details',style: TextStyle(
                color: Colors.black,
                fontSize: 16, fontWeight: FontWeight.bold
            ),
            )
            ),
            SizedBox(height: 20,),
            TexInputWithHeading(Heading: 'Customer Name', Type: TextInputType.name, icon: Icon(Icons.people), errorMessage: 'please enter your name', needTofocus: _firstFocusNode, myFocus: null, conditionForData: FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), listeningHeading: 'name', hintText: 'Venkatesan',),
            SizedBox(height: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputHeading(heading: 'Phone Number'),
                if(_initialCountryCode !='')
                  IntlPhoneField(
                    onChanged: (value){
                      print(value);
                    },
                    needTofocus: _secondFocusNode,
                    focusNode: _firstFocusNode,
                    initialCountryCode: _initialCountryCode,
                    decoration: inputDecoration(Icon(Icons.phone), null),
                    SuffixIcon: null,
                    myController: numberTextController,
                  )
                else
                  IntlPhoneField(
                    onChanged: (value){
                      print(value);
                    },
                    needTofocus: _secondFocusNode,
                    focusNode: _firstFocusNode,
                    initialCountryCode: 'IN',
                    decoration: inputDecoration(Icon(Icons.phone), null),
                    SuffixIcon: null, myController: numberTextController,
                  )
              ],
            ),
            // country(),
            SizedBox(
              height: 10.0,
            ),
            TexInputWithHeading(Heading: 'Email Id', Type: TextInputType.emailAddress, icon: Icon(Icons.email), errorMessage: 'please enter email id', needTofocus: _thirdFocusNode, myFocus: _secondFocusNode, conditionForData: FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')), listeningHeading: 'email_id', hintText: 'Venkatesan@gmail.com',),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputHeading(heading: 'Country'),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: MyDropDown(initialValue: '-', itemList: widget.list,),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputHeading(heading: 'State'),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: MyDropDown(initialValue: '-', itemList:  widget.list,),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputHeading(heading: 'District'),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: MyDropDown(initialValue: '-', itemList:  widget.list,),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10.0,),
                Expanded(
                  child: TexInputWithHeading(Heading: 'Pincode', Type: TextInputType.number, icon: Icon(Icons.code), errorMessage: 'please enter pincode', needTofocus: _fourthFocusNode, myFocus: _thirdFocusNode, conditionForData: FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), listeningHeading: 'pincode', hintText: '641006',),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(
                  child: TexInputWithHeading(Heading: 'Taluk', Type: TextInputType.name, icon: Icon(Icons.local_post_office), errorMessage: 'please enter taluk', needTofocus: _fifthFocusNode, myFocus: _fourthFocusNode, conditionForData:  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), listeningHeading: 'taluk', hintText: 'north',),
                ),
                SizedBox(width: 10.0,),
                Expanded(
                  child: TexInputWithHeading(Heading: 'Village', Type: TextInputType.name, icon: Icon(Icons.holiday_village), errorMessage: 'please enter village', needTofocus: _sixthFocusNode, myFocus: _fifthFocusNode, conditionForData: FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), listeningHeading: 'village', hintText: 'Ganapathy',),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            TexInputWithHeading(Heading: 'Address 1', Type: TextInputType.streetAddress, icon: Icon(Icons.location_city), errorMessage: 'please fill address', needTofocus: _seventhFocusNode, myFocus: _sixthFocusNode, conditionForData: FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s\-\.,#]')), listeningHeading: 'add1', hintText: 'xyz address 1',),
            SizedBox(height: 10.0,),
            TexInputWithHeading(Heading: 'Address 2', Type: TextInputType.streetAddress, icon: Icon(Icons.location_city), errorMessage: 'please fill address', needTofocus: null, myFocus: _seventhFocusNode, conditionForData: FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s\-\.,#]')), listeningHeading: 'add2', hintText: 'Enter your address 2',),
            SizedBox(height: 30,),
            BouncingButton(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          liteYellow,
                          Color(0XFFFFB506)
                        ]
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: liteYellow
                ),
                padding: EdgeInsets.only(top: 15,bottom: 15),
                child: Center(child: Text('Create & Sell', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerDevice()));
              },
            ),
            SizedBox(height: 35,),
          ],
        ),
      ),
    );
  }
}

