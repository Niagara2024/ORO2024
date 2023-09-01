import 'package:bouncing_button/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:oro_2024/screens/customer_device.dart';
import 'package:oro_2024/state_management/sell_device_provider.dart';
import 'package:oro_2024/utils/widgets/form%20needs/inputHeading.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../state_management/customer_device_provider.dart';
import '../utils/my_theme.dart';

class BottomSheetForSellingDevice extends StatefulWidget {
  const BottomSheetForSellingDevice({super.key});

  @override
  State<BottomSheetForSellingDevice> createState() => _BottomSheetForSellingDeviceState();
}

class _BottomSheetForSellingDeviceState extends State<BottomSheetForSellingDevice> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  TextEditingController numberTextController = TextEditingController();
  String _initialCountryCode = '';
  String phoneNumber = '';



  @override
  void initState() {
    numberTextController.addListener(() {
      print('Text changed: ${numberTextController.text}');
    });
    _getLocationAndSetCountryCode();
    super.initState();
  }
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

  @override
  Widget build(BuildContext context) {
    var SellDevicePvd = Provider.of<SellDeviceProvider>(context, listen : true);
    var CustmDevicePvd = Provider.of<CustomerDevicePvd>(context, listen : true);
    if(SellDevicePvd.sellTO != ''){
      setState(() {
        numberTextController.text = CustmDevicePvd.listOfCustomer[int.parse(SellDevicePvd.sellTO)]['number']!;
      });
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0))
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Sell to customer'),
              ),
              IconButton(
                  onPressed: (){
                    SellDevicePvd.clearFunction();
                    SellDevicePvd.editSellTo('');
                    SellDevicePvd.editLongPress(false);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.cancel_outlined)),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: SellDevicePvd.getList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.only(left: 20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: liteBlue
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Device name : ${SellDevicePvd.SellDevices[SellDevicePvd.getList[index]]['name']}', style: TextStyle(fontSize: 14),),
                                        Text('Device IMEI no : ${SellDevicePvd.SellDevices[SellDevicePvd.getList[index]]['IMEI']}', style: TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height : 30,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    color: Colors.white,
                                    onPressed: (){
                                      setState(() {
                                        SellDevicePvd.removeFunction(SellDevicePvd.getList[index]);
                                      });
                                    },
                                    icon: Icon(Icons.clear_rounded, size: 18,),),
                                ),
                              ],
                            ),
                          );
                          // return pages[index % pages.length];
                        },
                      ),
                    ),
                    SellDevicePvd.getList.length != 0 ? SmoothPageIndicator(
                      controller: controller,
                      count: SellDevicePvd.getList.length,
                      effect: const WormEffect(
                        dotHeight: 16,
                        dotWidth: 16,
                        type: WormType.normal,
                      ),
                    ) : Container(),
                    Container(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputHeading(heading: 'Phone Number'),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if(_initialCountryCode !='')
                                Expanded(
                                  child: IntlPhoneField(
                                    onChanged: (value){
                                      print(value);
                                      print(numberTextController.text);
                                      SellDevicePvd.editSellTo('');
                                    },
                                    needTofocus: null,
                                    focusNode: null,
                                    initialCountryCode: _initialCountryCode,
                                    decoration: inputDecoration(Icon(Icons.phone), null),
                                    SuffixIcon: null,
                                    controller: numberTextController
                                  ),
                                )
                              else
                                Expanded(
                                  child: IntlPhoneField(
                                    needTofocus: null,
                                    focusNode: null,
                                    initialCountryCode: 'IN',
                                    decoration: inputDecoration(Icon(Icons.phone), null),
                                    SuffixIcon: null,
                                    controller: numberTextController
                                  ),
                                ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                                width: 30,
                                  child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return CustomerDevice(purpose: 'sell',);
                                      }));
                                    },
                                      icon: Icon(Icons.people, size: 40,)))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Center(
                      child: Text('Create Account & sell',
                        style: TextStyle(color: Colors.blue),),
                    ),
                    SizedBox(height: 20,),
                    SellDevicePvd.sellTO != '' ? BouncingButton(
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
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.only(top: 15,bottom: 15),
                        child: Center(child: Text('Sell to ${CustmDevicePvd.listOfCustomer[int.parse(SellDevicePvd.sellTO)]['name']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                      ),
                      onPressed: () {
                        numberTextController.clear();
                      },
                    ) : Container(),
                    // SizedBox(height: 180,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom+20,)

        ],
      ),
    );
  }
}


class SellDeviceScreen extends StatefulWidget {
  final String purpose;
  String title;
  SellDeviceScreen({super.key, required this.purpose, required this.title});

  @override
  State<SellDeviceScreen> createState() => _SellDeviceScreenState();
}

class _SellDeviceScreenState extends State<SellDeviceScreen> {

  Future<void> callBottomSheet()async{
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context, builder: (
        BuildContext context){
      return BottomSheetForSellingDevice();
    });
  }

  @override
  Widget build(BuildContext context) {
    var SellDevicePvd = Provider.of<SellDeviceProvider>(context, listen : true);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title == '' ? ' Devices' : widget.title),
      ),
      floatingActionButton: SellDevicePvd.selectedList.length > 0 ? FloatingActionButton(
        onPressed: (){
          callBottomSheet();
        },
        child: Icon(Icons.sell),
      ) : null ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
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
                    //   if(SellDevicePvd.longpress == true && !SellDevicePvd.getList.contains(i)){
                    //     SellDevicePvd.addFunction(i);
                    //   }
                    //   else if(SellDevicePvd.longpress == true && SellDevicePvd.getList.contains(i)){
                    //     SellDevicePvd.removeFunction(i);
                    //   }
                    //   if(SellDevicePvd.getList.length == 0){
                    //     SellDevicePvd.editLongPress(false);
                    //   }
                    // },
                    // onLongPress: (){
                    //   SellDevicePvd.editLongPress(true);
                    //   if(SellDevicePvd.longpress = true){
                    //     SellDevicePvd.addFunction(i);
                    //   }
                    },
                    trailing: widget.purpose == 'browse' ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(liteYellow)),
                      onPressed: (){
                        SellDevicePvd.selectedSellDevice(i);
                        Navigator.pop(context);
                      },
                      child: Text('Replace', style: TextStyle(color: Colors.black),),
                    ) : Checkbox(
                        value: SellDevicePvd.SellDevices[i]['sell'],
                        onChanged: (value){
                          SellDevicePvd.editSellDevices(value!,i);
                          if(value == true){
                            SellDevicePvd.addFunction(i);
                          }else{
                            SellDevicePvd.removeFunction(i);
                          }
                        }),
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
            SizedBox(height: 100.0,)          ],
        ),
      ),
    );
  }
}
