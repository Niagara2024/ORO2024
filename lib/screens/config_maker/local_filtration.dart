import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state_management/config_maker_provider.dart';
import '../../theme/Theme.dart';

class LocalFiltrationTable extends StatefulWidget {
  const LocalFiltrationTable({super.key});

  @override
  State<LocalFiltrationTable> createState() => LocalFiltrationTableState();
}

class LocalFiltrationTableState extends State<LocalFiltrationTable> {
  bool selectButton = false;
  @override
  Widget build(BuildContext context) {
    var configPvd = Provider.of<ConfigMakerProvider>(context, listen: true);
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint){
      var width = constraint.maxWidth;
      return Container(
        margin: MediaQuery.of(context).orientation == Orientation.portrait ? null : EdgeInsets.only(right: 70),
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
                      Text('Total L.Dosing : '),
                      Text('${configPvd.totalLocalFiltration}')
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
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: Center(
                        child: Text('Line',style: TextStyle(color: Colors.white),),
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
                      child: Center(
                        child: Text('Filter',style: TextStyle(color: Colors.white),),
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
                          Text('Valve',style: TextStyle(color: Colors.white),),
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
                          Text('D.Press',style: TextStyle(color: Colors.white),),
                          Text('Sensor',style: TextStyle(color: Colors.white),),
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
                  itemCount: configPvd.localFiltration.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: index == configPvd.localFiltration.length - 1 ? EdgeInsets.only(bottom: 60) : null,
                      color: index % 2 != 0 ? Colors.blue.shade100 : Colors.blue.shade50,
                      width: width-20,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if(selectButton == true)
                                      Checkbox(
                                          value: configPvd.localFiltration[index][4] == 'select' ? true : false,
                                          onChanged: (value){
                                            configPvd.localFiltrationFunctionality(['selectLocalFiltration',index,value]);
                                          }),
                                    Text('${configPvd.localFiltration[index][0]}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                                child: Center(
                                  child: TextFormField(
                                    initialValue: '${configPvd.localFiltration[index][1]}',
                                    maxLength: 1,
                                    onChanged: (value){
                                      configPvd.localFiltrationFunctionality(['editFilter',index,value]);
                                    },
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        counterText: '',
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none
                                        )
                                    ),
                                  ),
                                )
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              child: Checkbox(
                                  value: configPvd.localFiltration[index][2],
                                  onChanged: (value){
                                    configPvd.localFiltrationFunctionality(['editDownStreamValve',index,value]);
                                  }),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              child: Checkbox(
                                  value: configPvd.localFiltration[index][3],
                                  onChanged: (value){
                                    configPvd.localFiltrationFunctionality(['editDiffPressureSensor',index,value]);
                                  }),
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
