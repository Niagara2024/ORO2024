import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:siva_oro_2024/custom_widgets/AppBarNeeds.dart';
import 'package:siva_oro_2024/theme/Theme.dart';
import 'package:csc_picker/csc_picker.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        leading: AppBarArrow(),
        title: AppBarText(title: 'Create Account',),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text('Customer Name', style: inputsHeading,),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          )
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text('Phone Number', style: inputsHeading,),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder()
                      ),
                    )
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text('Country, state & city', style: inputsHeading,),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.5), top: BorderSide(width: 0.5), right: BorderSide(width: 0.5), left: BorderSide(width: 0.5)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: CSCPicker(
                  disabledDropdownDecoration: BoxDecoration(
                    color: liteBlue,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  dropdownDecoration: BoxDecoration(),
                  dropdownHeadingStyle: inputsHeading,
                  onCountryChanged: (value) {
                    setState(() {
                      // countryValue = value;
                    });
                  },
                  onStateChanged:(value) {
                    setState(() {
                      // stateValue = value;
                    });
                  },
                  onCityChanged:(value) {
                    setState(() {
                      // cityValue = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: Text('Pincode', style: inputsHeading,),
                          ),
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: Text('Taluk', style: inputsHeading,),
                          ),
                          Container(
                            // height: 40,
                            color: Colors.white,
                            width: double.infinity,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              // style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text('Village', style: inputsHeading,),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          )
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text('Address 1', style: inputsHeading,),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          )
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text('Address 2', style: inputsHeading,),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          )
                      ),
                    ),
                  )
                ],
              ),




            ],
          ),
        ),
      ),
    );
  }
}
