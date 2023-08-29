import 'package:flutter/material.dart';
import 'package:oro_2024/screens/replace_device.dart';
import 'package:oro_2024/state_management/customer_device_provider.dart';
import 'package:oro_2024/utils/theme.dart';
import 'package:provider/provider.dart';

import '../utils/my_theme.dart';
import '../utils/widgets/text_form_field.dart';

class BottomSheetForDevices extends StatefulWidget {
  const BottomSheetForDevices({super.key});

  @override
  State<BottomSheetForDevices> createState() => _BottomSheetForDevicesState();
}

class _BottomSheetForDevicesState extends State<BottomSheetForDevices> {
  @override
  Widget build(BuildContext context) {
    var CustmDevicePvd = Provider.of<CustomerDevicePvd>(context, listen : true);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text('Sivaprakash Devices'),
                Icon(Icons.cancel_outlined),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: ListView.builder(
                  itemCount: CustmDevicePvd.customerDeviceList.length,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onLongPress: (){
                        CustmDevicePvd.selecteDevice(index);
                        print('clicked ${index}');
                      },
                      onTap: (){
                        CustmDevicePvd.removeSelected();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: CustmDevicePvd.customerDeviceList[index]['selected'] == 'yes' ? liteBlue : null,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: ListTile(
                          trailing: Visibility(
                            visible: CustmDevicePvd.customerDeviceList[index]['selected'] == 'yes' ? true : false,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(liteYellow)),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return ReplaceDevice();
                                }));
                              },
                              child: Text('Replace', style: TextStyle(color: Colors.black),),
                            ),
                          ),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                          ),
                          title: Text('${CustmDevicePvd.customerDeviceList[index]['name']}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${CustmDevicePvd.customerDeviceList[index]['IMEI']}', style: TextStyle(fontSize: 12,color: Colors.black87)),
                              Text('${CustmDevicePvd.customerDeviceList[index]['saledDate']}', style: TextStyle(fontSize: 12,color: Colors.black87)),
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


class CustomerDevice extends StatefulWidget {
  const CustomerDevice({super.key});

  @override
  State<CustomerDevice> createState() => _CustomerDeviceState();
}

class _CustomerDeviceState extends State<CustomerDevice> {
  Future<void> callBottonSheet(CustomerDevicePvd thisPvd)async{
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context, builder: (BuildContext context){
          return BottomSheetForDevices();
    });
  }

  @override
  Widget build(BuildContext context) {
    var CustmDevicePvd = Provider.of<CustomerDevicePvd>(context, listen : true);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:20.0) ,
            child: GestureDetector(
              onTap: (){
                CustmDevicePvd.changeFilterRating();
              },
                child: CustmDevicePvd.filterRating == 'no' ? Icon(Icons.star_border) : Icon(Icons.star)
            ),
          ),
        ],
        title: Text('My Customers'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomeTextField(myFocus: null, needTofocus: null, listeningHeading: null, errorMessage: null, Type: null, hintText: 'Search Customer', icon: Icon(Icons.search, color: Colors.black54,)),
          ),
          if(CustmDevicePvd.filterRating == 'no')
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                  itemCount: CustmDevicePvd.listOfCustomer.length,
                    itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black12
                      ),
                    ),
                    title: Container(
                        child: Text('${CustmDevicePvd.listOfCustomer[index]['name']}')
                    ),
                    trailing: Container(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: InkWell(
                                child: Icon(Icons.list),
                            ),
                            onTap: (){
                              callBottonSheet(CustmDevicePvd);
                            },
                          ),
                          CustmDevicePvd.listOfCustomer[index]['rating'] == 'yes' ? GestureDetector(
                            onTap: (){
                              CustmDevicePvd.changeRating(index);
                            },
                              child: Icon(Icons.star, color: liteYellow,)
                          ) : GestureDetector(
                            onTap: (){
                              CustmDevicePvd.changeRating(index);
                            },
                              child: Icon(Icons.star_border, color: liteYellow,)
                          )
                        ],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${CustmDevicePvd.listOfCustomer[index]['number']}', style: TextStyle(fontSize: 12,color: Colors.black87),),
                        Text('${CustmDevicePvd.listOfCustomer[index]['city']}',  style: TextStyle(fontSize: 12,color: Colors.black87))
                      ],
                    ),
                  );
                }),
              ),
            )
          else
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                    itemCount: CustmDevicePvd.onlyRated().length,
                    itemBuilder: (BuildContext context,int index){
                      return ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.black12
                          ),
                        ),
                        title: Container(
                            child: Text('${CustmDevicePvd.onlyRated()[index]['name']}')
                        ),
                        trailing: Container(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                child: InkWell(
                                  child: Icon(Icons.list),
                                ),
                                onTap: (){
                                  callBottonSheet(CustmDevicePvd);
                                },
                              ),
                            ],
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${CustmDevicePvd.onlyRated()[index]['number']}', style: TextStyle(fontSize: 12,color: Colors.black87),),
                            Text('${CustmDevicePvd.onlyRated()[index]['city']}',  style: TextStyle(fontSize: 12,color: Colors.black87))
                          ],
                        ),
                      );
                    }),
              ),
            ),





        ],
      ),
    );
  }
}
