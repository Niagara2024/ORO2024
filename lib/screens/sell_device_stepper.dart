import 'package:bouncing_button/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/utils/widgets/form%20needs/create_account_form.dart';
import 'package:provider/provider.dart';

import '../state_management/customer_device_provider.dart';
import '../state_management/sell_device_provider.dart';
import '../theme/Theme.dart';

class SellDeviceStepper extends StatefulWidget {
  const SellDeviceStepper({Key? key}) : super(key: key);

  @override
  State<SellDeviceStepper> createState() => _SellDeviceStepperState();
}

class _SellDeviceStepperState extends State<SellDeviceStepper> {
  int _index = 0;
  int customerSelection = -1;
  int mode = 0;
  List<String> CountryData = ['-', 'india', 'america', 'russia'];


  @override
  Widget build(BuildContext context) {
    var SellDevicePvd = Provider.of<SellDeviceProvider>(context, listen : true);
    var CustmDevicePvd = Provider.of<CustomerDevicePvd>(context, listen : true);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Assets'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Stepper(
                margin: EdgeInsets.zero,
                type: StepperType.horizontal,
                currentStep: _index,

                onStepTapped: (int index) {
                  setState(() {
                    _index = index;
                  });
                },
                steps: [
                  Step(
                    title: Text(''),
                    isActive: _index >= 0,
                    state: _index == 0 ? StepState.editing : StepState.complete,
                    content: Container(
                      padding: EdgeInsets.zero,
                      // color: Colors.yellow.shade50,
                      child: Column(
                        children: [
                          Center(
                            child: Text('Tap to select product to sell', style: TextStyle(
                                color: Colors.black,
                                fontSize: 16, fontWeight: FontWeight.bold
                            ),),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            height: 530,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  for(var i = 0; i < SellDevicePvd.SellDevices.length; i++)
                                    GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 2.0),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: SellDevicePvd.selectedList.contains(i) ? liteBlue : null,
                                            borderRadius: BorderRadius.circular(10.0)
                                        ),
                                        child: ListTile(
                                          onTap: (){
                                            if(!SellDevicePvd.getList.contains(i)){
                                              SellDevicePvd.addFunction(i);
                                            }
                                            else if(SellDevicePvd.getList.contains(i)){
                                              SellDevicePvd.removeFunction(i);
                                            }
                                          },
                                          trailing: Visibility(
                                              visible: SellDevicePvd.getList.contains(i) ? true : false,
                                              child: Icon(Icons.verified,color: PrimaryColor, size: 30,)),
                                          leading: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius: BorderRadius.circular(10.0)
                                            ),
                                          ),
                                          title: Text('${SellDevicePvd.SellDevices[i]['name']}'),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('${SellDevicePvd.SellDevices[i]['IMEI']}', style: TextStyle(fontSize: 12,color: Colors.black87)),
                                              Text('${SellDevicePvd.SellDevices[i]['buyDate']}', style: TextStyle(fontSize: 12,color: Colors.black87)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: 100,)
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Step(
                    title: Text(''),
                    isActive: _index >= 1,
                    state: _index == 1 ? StepState.editing : _index > 1 ? StepState.complete : StepState.indexed,
                    content: Container(
                      width: double.infinity,
                      height: 600,
                      child: DefaultTabController(
                        initialIndex: 0,
                        length: 2,
                        child: Column(
                          children: [
                            TabBar(
                              labelStyle: TextStyle(fontSize: 15),
                              tabs: <Widget>[
                                Tab(
                                  child: Text('Existing Customer', style: TextStyle(color: Colors.black),),
                                ),
                                Tab(
                                  child: Text('New Customer', style: TextStyle(color: Colors.black),),
                                ),

                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: <Widget>[
                                  Container(
                                    // color: Colors.yellow.shade50,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10.0,),
                                        Center(
                                          child: Text('Tap to select product to sell', style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16, fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                        SizedBox(height: 10.0,),
                                        Expanded(
                                          child: Container(
                                            child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    for(var i = 0; i < CustmDevicePvd.listOfCustomer.length; i++)
                                                      GestureDetector(
                                                        child: Container(
                                                          margin: EdgeInsets.only(bottom: 2.0),
                                                          width: double.infinity,
                                                          decoration: BoxDecoration(
                                                              color: i == customerSelection ? liteBlue : null,
                                                              borderRadius: BorderRadius.circular(10.0)
                                                          ),
                                                          child: ListTile(
                                                            onTap: (){
                                                              setState(() {
                                                                customerSelection = i;
                                                                print('index : $i  === $customerSelection'  );
                                                              });
                                                            },
                                                            trailing: i == customerSelection? Icon(Icons.verified,color: PrimaryColor, size: 30,) : SizedBox(width: 5,),
                                                            leading: Container(
                                                              width: 50,
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.black12,
                                                                  borderRadius: BorderRadius.circular(10.0)
                                                              ),
                                                            ),
                                                            title: Text('${CustmDevicePvd.listOfCustomer[i]['name']}'),
                                                            subtitle: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text('${CustmDevicePvd.listOfCustomer[i]['number']}', style: TextStyle(fontSize: 12,color: Colors.black87)),
                                                                Text('${CustmDevicePvd.listOfCustomer[i]['city']}', style: TextStyle(fontSize: 12,color: Colors.black87)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    SizedBox(height: 100,)
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      // color: Colors.yellow.shade50,
                                      padding: EdgeInsets.all(20.0),
                                      height: 600,
                                      child: CreateAccount(list: CountryData, dropDowm_initial_value: '-',)),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Step(
                    title: Text(''),
                    isActive: _index >= 2,
                    state: _index == 2 ? StepState.editing : _index > 2 ? StepState.complete : StepState.indexed,
                    content: Container(
                      // Your step content for step 3
                    ),
                  ),

                ],
                controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
                  return Container(); // This will return an empty container, effectively removing the buttons
                },
              ),
            ),
          ),
          BouncingButton(
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: PrimaryColor
              ),
              padding: EdgeInsets.only(top: 15,bottom: 15),
              margin: EdgeInsets.only(top: 15,bottom: 15),
              child: Center(child: Text('Continue', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)),
            ),
            onPressed: () {
              setState(() {
                if(_index < 2){
                  _index += 1;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
