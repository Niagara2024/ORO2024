import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state_management/config_maker_provider.dart';
import '../../theme/Theme.dart';
import '../../utils/widgets/form needs/drop_down_button.dart';

class CentralFiltrationTable extends StatefulWidget {
  const CentralFiltrationTable({super.key});

  @override
  State<CentralFiltrationTable> createState() => _CentralFiltrationTableState();
}

class _CentralFiltrationTableState extends State<CentralFiltrationTable> {
  bool selectButton = false;
  @override
  Widget build(BuildContext context) {
    var configPvd = Provider.of<ConfigMakerProvider>(context, listen: true);
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint){
      var width = constraint.maxWidth;
      return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                          value: selectButton,
                          onChanged: (value){
                            setState(() {
                              selectButton = value!;
                            });
                          }
                      ),
                      Text('Select')
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text('Total C.filtration : '),
                      Text('${configPvd.totalCentralFiltration}')
                    ],
                  ),
                ),
                SizedBox(width: 10,)

              ],
            ),
            Container(
              width: width-20,
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('#',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: PrimaryColor
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Filters',style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: PrimaryColor
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('D.stream',style: TextStyle(color: Colors.white),),
                          Text('Valve',style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: PrimaryColor
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Press.',style: TextStyle(color: Colors.white),),
                          Text('Sensor',style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: PrimaryColor
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: configPvd.centralFiltration.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: index == configPvd.centralFiltration.length - 1 ? EdgeInsets.only(bottom: 60) : null,
                      color: index % 2 != 0 ? Colors.blue.shade100 : Colors.blue.shade50,
                      width: width-20,
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if(selectButton == true)
                                    Checkbox(
                                        value: configPvd.centralFiltration[index][3] == 'select' ? true : false,
                                        onChanged: (value){
                                          configPvd.selectSourcePump(index);
                                        }),
                                  Text('${index + 1}'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                width: double.infinity,
                                height: 60,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none
                                    )
                                  ),
                                )
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              child: Center(
                                child:  Checkbox(
                                    value: configPvd.sourcePump[index][1],
                                    onChanged: (value){
                                      configPvd.editWaterMeter(value!, index);
                                    }
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
