import 'package:bouncing_button/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/screens/sell_device.dart';
import 'package:oro_2024/utils/my_theme.dart';
import 'package:provider/provider.dart';

import '../state_management/customer_device_provider.dart';
import '../state_management/sell_device_provider.dart';

class ReplaceDevice extends StatefulWidget {
  final int selectedCusomer;
  final int SelectedDevice;
  const ReplaceDevice({super.key, required this.selectedCusomer, required this.SelectedDevice});

  @override
  State<ReplaceDevice> createState() => _ReplaceDeviceState();
}

class _ReplaceDeviceState extends State<ReplaceDevice> {
  bool replaceCustomerDeviceCancel = false;
  bool replaceSellDeviceCancel = false;
  bool canGo = false;
  @override
  Widget build(BuildContext context) {
    var SellDevicePvd = Provider.of<SellDeviceProvider>(context, listen : true);
    var CustmDevicePvd = Provider.of<CustomerDevicePvd>(context, listen : true);
    var customer = CustmDevicePvd.listOfCustomer[widget.selectedCusomer];
    var device = CustmDevicePvd.customerDeviceList[widget.SelectedDevice];
    setState(() {
      replaceSellDeviceCancel = SellDevicePvd.selectedDevice == 'no' ? true : false;
    });
    print(SellDevicePvd.selectedDevice);
    print('replaceSellDeviceCancel ${replaceSellDeviceCancel}');
    print('replaceCustomerDeviceCancel ${replaceCustomerDeviceCancel}');
    return Container();

    // return PopScope(
    //   canPop: canGo,
    //   onPopInvoked: (bool goBack){
    //     print(goBack);
    //     if(!goBack){
    //       showDialog(context: context, builder: (context){
    //         return AlertDialog(
    //           title: Text('Confirmation', style: TextStyle(color: Colors.black87),),
    //           content: Text('Do you want to exit?'),
    //           actions: [
    //             ElevatedButton(
    //                 onPressed: (){
    //                   Navigator.of(context).pop(false);
    //                 },
    //                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
    //                 child: Text('cancel',style: TextStyle(color: Colors.white),)),
    //             ElevatedButton(
    //                 onPressed: (){
    //                   setState(() {
    //                     canGo = true;
    //                   });
    //                   SellDevicePvd.removeSelected();
    //                   CustmDevicePvd.removeSelected();
    //                   Navigator.pop(context);
    //                   Navigator.pop(context);
    //                 },
    //                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
    //                 child: Text('ok',style: TextStyle(color: Colors.white))),
    //
    //           ],
    //         );
    //       });
    //     }
    //   },
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Replace'),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           SizedBox(height: 20.0,),
    //           Container(
    //             margin: EdgeInsets.all(10.0),
    //             decoration: BoxDecoration(
    //               color: Color(0XFFF3F3F3),
    //               borderRadius: BorderRadius.circular(20.0)
    //             ),
    //
    //             width: double.infinity,
    //             child: Column(
    //               children: [
    //                 Row(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Container(
    //                       child: Image.asset(
    //                           'assets/images/select.png'),
    //                       width: 80,
    //                       height: 80,
    //                       padding: EdgeInsets.only(left: 20.0),
    //                     ),
    //                     SizedBox(width: 20.0,),
    //                     Expanded(
    //                       child: Container(
    //                         width: double.infinity,
    //                           child: Text('Select customer product to replace', style: TextStyle(fontSize: 18),)),
    //                     )
    //                   ],
    //                 ),
    //                 if(replaceCustomerDeviceCancel == false)
    //                   Container(
    //                     width: double.infinity,
    //                     margin: EdgeInsets.all(20.0),
    //                     padding: EdgeInsets.only(left: 20.0,bottom: 20.0),
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(20.0),
    //                         color: Colors.white
    //                     ),
    //                     child: Row(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Expanded(
    //                           child: Container(
    //                             padding: EdgeInsets.only(top: 10.0),
    //                             width: double.infinity,
    //                             child: Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Text('Customer name : ${customer['name']}'),
    //                                 Text('Customer mobile number : ${customer['number']}'),
    //                                 Text('Device name : ${device['name']}'),
    //                                 Text('Device IMEI no : ${device['IMEI']}'),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           width: 40,
    //                           decoration: BoxDecoration(
    //                               shape: BoxShape.rectangle,
    //                               color: Colors.red,
    //                               borderRadius: BorderRadius.circular(5)
    //                           ),
    //                           child: IconButton(
    //                             color: Colors.white,
    //                             onPressed: (){
    //                               CustmDevicePvd.removeSelected();
    //                               setState(() {
    //                                 replaceCustomerDeviceCancel = true;
    //                               });
    //                             },
    //                             icon: Icon(Icons.clear_rounded),),
    //                         ),
    //                       ],
    //                     ),
    //                   )
    //                 else
    //                   Column(
    //                     children: [
    //                       ElevatedButton(
    //                         onPressed: (){
    //                           Navigator.pop(context);
    //
    //                         },
    //                         child: Text('Browse', style: TextStyle(
    //                             fontSize: 20,
    //                             color: Colors.white
    //                         ),),
    //                         style: ButtonStyle(
    //                             backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
    //                         ),
    //                       ),
    //                       SizedBox(height: 20.0,),
    //                     ],
    //                   ),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             width: 100,
    //             height: 100,
    //             child: Image.asset('assets/images/replace.png'),
    //           ),
    //           Container(
    //             margin: EdgeInsets.all(10.0),
    //             decoration: BoxDecoration(
    //                 color: Color(0XFFF3F3F3),
    //                 borderRadius: BorderRadius.circular(20.0)
    //             ),
    //
    //             width: double.infinity,
    //             child: Column(
    //               children: [
    //                 Row(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Container(
    //                       child: Image.asset(
    //                           'assets/images/select.png'),
    //                       width: 80,
    //                       height: 80,
    //                       padding: EdgeInsets.only(left: 20.0),
    //                     ),
    //                     SizedBox(width: 20.0,),
    //                     Expanded(
    //                       child: Container(
    //                           width: double.infinity,
    //                           child: Text('Select your product to replace', style: TextStyle(fontSize: 18),)),
    //                     )
    //                   ],
    //                 ),
    //                 if(SellDevicePvd.selectedDevice != 'no')
    //                   Container(
    //                     width: double.infinity,
    //                     margin: EdgeInsets.all(20.0),
    //                     padding: EdgeInsets.only(left: 20.0,bottom: 20.0),
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(20.0),
    //                         color: Colors.white
    //                     ),
    //                     child: Row(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Expanded(
    //                           child: Container(
    //                             padding: EdgeInsets.only(top: 10.0),
    //                             width: double.infinity,
    //                             child: Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Text('Customer name : Uthamaraj'),
    //                                 Text('Customer mobile number : 9578425478'),
    //                                 Text('Device name : ${SellDevicePvd.SellDevices[int.parse(SellDevicePvd.selectedDevice)]['name']}'),
    //                                 Text('Device IMEI no : ${SellDevicePvd.SellDevices[int.parse(SellDevicePvd.selectedDevice)]['IMEI']}'),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           width: 40,
    //                           decoration: BoxDecoration(
    //                               shape: BoxShape.rectangle,
    //                               color: Colors.red,
    //                               borderRadius: BorderRadius.circular(5)
    //                           ),
    //                           child: IconButton(
    //                             color: Colors.white,
    //                             onPressed: (){
    //                               SellDevicePvd.removeSelected();
    //                               setState(() {
    //                                 replaceSellDeviceCancel = true;
    //                               });
    //                             },
    //                             icon: Icon(Icons.clear_rounded),),
    //                         ),
    //                       ],
    //                     ),
    //                   )
    //                 else
    //                   Column(
    //                     children: [
    //                       ElevatedButton(
    //                         onPressed: (){
    //                           Navigator.push(context, MaterialPageRoute(builder: (context){
    //                             return SellDeviceScreen(purpose: 'browse', title: 'Select product to replace',);
    //                           }));
    //
    //                         },
    //                         child: Text('Browse to select your product', style: TextStyle(
    //                             fontSize: 20,
    //                             color: Colors.white
    //                         ),),
    //                         style: ButtonStyle(
    //                             backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
    //                         ),
    //                       ),
    //                       SizedBox(height: 20.0,)
    //                     ],
    //                   )
    //               ],
    //             ),
    //           ),
    //           if(replaceCustomerDeviceCancel == false && replaceSellDeviceCancel == false)
    //             BouncingButton(
    //               child: Container(
    //                 margin: EdgeInsets.all(20.0),
    //                 width: double.infinity,
    //                 decoration: BoxDecoration(
    //                     gradient: LinearGradient(
    //                         begin: Alignment.topLeft,
    //                         end: Alignment.bottomRight,
    //                         colors: [
    //                           liteYellow,
    //                           Color(0XFFFFB506)
    //                         ]
    //                     ),
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: liteYellow
    //                 ),
    //                 padding: EdgeInsets.only(top: 15,bottom: 15),
    //                 child: Center(child: Text('Click to replace', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
    //               ),
    //               onPressed: () {
    //               },
    //             ),
    //
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
