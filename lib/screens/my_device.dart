import 'package:flutter/material.dart';
import 'package:oro_2024/state_management/my_device_provider.dart';
import 'package:provider/provider.dart';
import '../utils/my_theme.dart';

class MyDevice extends StatefulWidget {
  const MyDevice({super.key});

  @override
  State<MyDevice> createState() => _MyDeviceState();
}

class _MyDeviceState extends State<MyDevice> {
  @override
  Widget build(BuildContext context) {
    var MyDevicePvd = Provider.of<MyDeviceProvider>(context, listen : true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Device to replace'),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
        ),
        child: Container(
          width: double.infinity,
          child: ListView.builder(
              itemCount: MyDevicePvd.Mydevices.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: ListTile(
                    trailing: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(liteYellow)),
                      onPressed: (){
                        MyDevicePvd.selectedMyDevice(index);
                        Navigator.pop(context);
                      },
                      child: Text('Replace', style: TextStyle(color: Colors.black),),
                    ),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                    title: Text('${MyDevicePvd.Mydevices[index]['name']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${MyDevicePvd.Mydevices[index]['IMEI']}', style: TextStyle(fontSize: 12,color: Colors.black87)),
                        Text('${MyDevicePvd.Mydevices[index]['buyDate']}', style: TextStyle(fontSize: 12,color: Colors.black87)),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
