import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:oro_2024/state_management/customer_device_provider.dart';
import 'package:oro_2024/state_management/sell_device_provider.dart';
import 'package:oro_2024/utils/theme.dart';
import 'package:provider/provider.dart';

import '../theme/Theme.dart';

class ServiceRequest extends StatefulWidget {
   const ServiceRequest({super.key});

  @override
  State<ServiceRequest> createState() => _ServiceRequestState();
}

class _ServiceRequestState extends State<ServiceRequest> {
  Image trailingIcon = Image.asset('assets/images/closed.png'); // Default icon
  String serviceStatus = '';
  Future<void> callBottonSheet(int selectedCustomer) async {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return BottomSheetForDevices(
            selectedCustomer: selectedCustomer,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var MyDevicePvd = Provider.of<SellDeviceProvider>(context, listen: true);
    var CustmDevicePvd = Provider.of<CustomerDevicePvd>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Request '),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            //  child: CustomeTextField(myFocus: null, needTofocus: null, listeningHeading: null, errorMessage: null, Type: null, hintText: 'Search Customer', icon: Icon(Icons.search, color: Colors.black54,)),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                  itemCount: CustmDevicePvd.listOfCustomer.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black12),
                      ),
                      title: Container(
                          child: Text(
                              '${CustmDevicePvd.listOfCustomer[index]['name']}')),
                      trailing: Container(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.info,
                                color: liteYellow,
                              ),
                              onPressed: () {
                                callBottonSheet(index);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: PrimaryColor,
                              ),
                              onPressed: () {
                                _showBottomSheetRemarks();
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                _showOptionsDialog(context);
                              },
                              child: Container(
                                  height: 40, width: 40, child: trailingIcon),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${CustmDevicePvd.listOfCustomer[index]['number']}',
                            style:
                            TextStyle(fontSize: 12, color: Colors.black87),
                          ),
                          Text(
                              '${CustmDevicePvd.listOfCustomer[index]['city']}',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black87)),
                          Text("Motor Can't Start",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black87))
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  void _updateIcon() {
    // Update icon based on API value
    setState(() {
      if (serviceStatus == 'open') {
        trailingIcon = Image.asset('assets/images/open-sign.png');
      } else if (serviceStatus == 'close') {
        trailingIcon = Image.asset('assets/images/closed.png');
      } else {
        trailingIcon = Image.asset('assets/images/work-in-progress.png');
      }
    });
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // bool remarks = false;
        bool closed = false;
        TextEditingController _textController = TextEditingController();

        return AlertDialog(
          // backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'Select an option',
            style: TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Image.asset('assets/images/open-sign.png'),
                  title: Text('open'),
                  onTap: () {
                    // Update the API value here
                    setState(() {
                      serviceStatus = 'open';
                      _updateIcon();
                      Navigator.pop(context);
                    });
                  },
                ),

                ListTile(
                  leading: Image.asset('assets/images/work-in-progress.png'),
                  title: Text('inprogress'),
                  onTap: () {
                    // Update the API value here
                    setState(() {
                      serviceStatus = 'inprogress';
                      _updateIcon();
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Image.asset('assets/images/closed.png'),
                  title: Text('close'),
                  onTap: () {
                    // Update the API value here
                    setState(() {
                      serviceStatus = 'close';
                      _updateIcon();
                      Navigator.pop(context);
                    });

                  },
                ),
                // remarks == true
                //
              ],
            ),
          ),
        );
      },
    );
  }

  final TextEditingController _textEditingController = TextEditingController();
  String _enteredText = '';

  void _showBottomSheetRemarks() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Remarks:"),
              TextField(
                controller: _textEditingController,
                maxLines: null,
                maxLength: 50, // Allow multiple lines
                decoration: InputDecoration(
                  labelText: 'Enter Text',
                  border: UnderlineInputBorder(),
                  // Use underline border
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _enteredText = _textEditingController.text;
                  });
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom+20,)
            ],
          ),
        );
      },
    );
  }
}
// }

class BottomSheetForDevices extends StatefulWidget {
  final int selectedCustomer;
  const BottomSheetForDevices({super.key, required this.selectedCustomer});

  @override
  State<BottomSheetForDevices> createState() => _BottomSheetForDevicesState();
}

class _BottomSheetForDevicesState extends State<BottomSheetForDevices> {
  @override
  Widget build(BuildContext context) {
    var CustmDevicePvd = Provider.of<CustomerDevicePvd>(context, listen: true);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                    '${CustmDevicePvd.listOfCustomer[widget.selectedCustomer]['name']} Service Request History'),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_outlined)),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: ListView.builder(
                  itemCount: CustmDevicePvd.customerDeviceList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onLongPress: () {
                        CustmDevicePvd.selectedDevice(index);
                        print('clicked ${index}');
                      },
                      onTap: () {
                        CustmDevicePvd.removeSelected();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: (CustmDevicePvd.selected != 'no' &&
                                index == int.parse(CustmDevicePvd.selected))
                                ? liteBlue
                                : null,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          trailing: Text(
                              '${CustmDevicePvd.customerDeviceList[index]['saledDate']}',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black87)),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          title: Text(
                              '${CustmDevicePvd.customerDeviceList[index]['name']}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${CustmDevicePvd.customerDeviceList[index]['IMEI']}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black87)),
                              Text(
                                  'Open Date: ' +
                                      '${CustmDevicePvd.customerDeviceList[index]['saledDate']}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black87)),
                              Text(
                                  'Close Date: ' +
                                      '${CustmDevicePvd.customerDeviceList[index]['saledDate']}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black87)),
                              Text('Remarks ' + 'IC Change',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black87)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}