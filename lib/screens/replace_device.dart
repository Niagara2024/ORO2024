import 'package:flutter/material.dart';
import 'package:oro_2024/screens/my_device.dart';
import 'package:oro_2024/utils/my_theme.dart';
import 'package:provider/provider.dart';

import '../state_management/customer_device_provider.dart';
import '../state_management/my_device_provider.dart';

class ReplaceDevice extends StatefulWidget {
  final int selectedCusomer;
  final int SelectedDevice;
  const ReplaceDevice({super.key, required this.selectedCusomer, required this.SelectedDevice});

  @override
  State<ReplaceDevice> createState() => _ReplaceDeviceState();
}

class _ReplaceDeviceState extends State<ReplaceDevice> {
  bool replaceCustomerDeviceCancel = false;
  bool replaceMyDeviceCancel = false;
  @override
  Widget build(BuildContext context) {
    var MyDevicePvd = Provider.of<MyDeviceProvider>(context, listen : true);
    var CustmDevicePvd = Provider.of<CustomerDevicePvd>(context, listen : true);
    var customer = CustmDevicePvd.listOfCustomer[widget.selectedCusomer];
    var device = CustmDevicePvd.customerDeviceList[widget.SelectedDevice];
    setState(() {
      replaceMyDeviceCancel = MyDevicePvd.selectedDevice == 'no' ? true : false;
    });
    print(MyDevicePvd.selectedDevice);
    print('replaceMyDeviceCancel ${replaceMyDeviceCancel}');
    print('replaceCustomerDeviceCancel ${replaceCustomerDeviceCancel}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Replace'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0,),
          Center(
            child: Text('Replace', style: TextStyle(fontSize: 20, color: PrimaryColor, fontWeight: FontWeight.bold),),
          ),
          if(replaceCustomerDeviceCancel == false)
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0,top: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: liteBlue
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: IconButton(
                        onPressed: (){
                          CustmDevicePvd.removeSelected();
                          setState(() {
                            replaceCustomerDeviceCancel = true;
                          });
                        },
                        icon: Icon(Icons.clear_rounded)),
                    alignment: Alignment.topRight,
                  ),
                  Text('Customer name : ${customer['name']}'),
                  Text('Customer mobile number : ${customer['number']}'),
                  Text('Device name : ${device['name']}'),
                  Text('Device IMEI no : ${device['IMEI']}'),
                ],
              ),
            )
          else
            Column(
              children: [
                SizedBox(height: 20.0,),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);

                },
                child: Text('Browse to select customer product', style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(liteYellow)
                  ),
                )
              ],
            ),
          SizedBox(height: 50,),
          Text('To', style: TextStyle(fontSize: 20, color: PrimaryColor, fontWeight: FontWeight.bold),),
          if(MyDevicePvd.selectedDevice != 'no')
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0,top: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: liteBlue
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: IconButton(
                        onPressed: (){
                          MyDevicePvd.removeSelected();
                          setState(() {
                            replaceMyDeviceCancel = true;
                          });
                        },
                        icon: Icon(Icons.clear_rounded)),
                    alignment: Alignment.topRight,
                  ),

                  Text('Customer name : Uthamaraj'),
                  Text('Customer mobile number : 9578425478'),
                  Text('Device name : ${MyDevicePvd.Mydevices[int.parse(MyDevicePvd.selectedDevice)]['name']}'),
                  Text('Device IMEI no : ${MyDevicePvd.Mydevices[int.parse(MyDevicePvd.selectedDevice)]['IMEI']}'),
                ],
              ),
            )
          else
            Column(
              children: [
                SizedBox(height: 20.0,),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MyDevice();
                    }));

                  },
                  child: Text('Browse to select your product', style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(liteYellow)
                  ),
                )

              ],
            ),
          SizedBox(
            height: 40,
          ),
          if(replaceCustomerDeviceCancel == false && replaceMyDeviceCancel == false)
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(liteYellow)
              ),
              onPressed: (){
            },
              child: Text('Replace', style: TextStyle(
                fontSize: 20,
                color: Colors.black
            ),
            ),

            )

        ],
      ),
    );
  }
}
