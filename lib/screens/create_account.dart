import 'package:flutter/material.dart';

import '../utils/widgets/form needs/create_account_form.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  List<String> CountryData = ['-', 'india', 'america', 'russia'];
  void countryCode()async{
    print('Device Country Code: $countryCode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2F2F2),
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if(constraints.maxWidth > 700){
                  return SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(40),
                      color : Color(0XFFF2F2F2),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 900,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(left: 50, right: 50,top: 30),
                              child: CreateAccount(list: CountryData, dropDowm_initial_value: '-',),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 900,
                              // height: createAcctProvider.height,
                              child: Image.asset(
                                  'assets/images/sign_up.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                else{
                  return Container(
                    height: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0,),
                    child: CreateAccount(list: CountryData, dropDowm_initial_value: '-',),
                  );
                }
              }
          ),
        ),
      ),
    );
  }
}
