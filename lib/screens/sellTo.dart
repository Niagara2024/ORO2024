import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Controller {
  String name;
  String imeiNumber;
  String type;

  Controller(
      {required this.name, required this.imeiNumber, required this.type});
}

class CustomerType {
  String name;

  CustomerType({required this.name});
}

class Customer {
  String name;
  String mobileNumber;

  Customer({required this.name, required this.mobileNumber});
}

class SellViewModel extends ChangeNotifier {
  List<Controller> controllers = [
    Controller(name: 'Controller 1', imeiNumber: '123456', type: 'Type A'),
    Controller(name: 'Controller 2', imeiNumber: '789012', type: 'Type B'),
    Controller(name: 'Controller 3', imeiNumber: '123456', type: 'Type A'),
    Controller(name: 'Controller 4', imeiNumber: '789012', type: 'Type B'),
    Controller(name: 'Controller 5', imeiNumber: '123456', type: 'Type A'),
    Controller(name: 'Controller 6', imeiNumber: '789012', type: 'Type B'),
  ];

  List<CustomerType> customerTypes = [
    CustomerType(name: 'Customer'),
    CustomerType(name: 'Dealer'),
    CustomerType(name: 'Myself'),
  ];

  List<Controller> selectedControllers = [];

  String selectedCustomerType = 'Customer';
  String customerMobileNumber = '';

  bool isSelected(Controller controller) {
    return selectedControllers.contains(controller);
  }

  void toggleSelection(Controller controller) {
    if (isSelected(controller)) {
      selectedControllers.remove(controller);
    } else {
      selectedControllers.add(controller);
    }
    notifyListeners();
  }

  void updateCustomerType(String newType) {
    selectedCustomerType = newType;
    notifyListeners();
  }

  void updateCustomerMobileNumber(String newMobileNumber) {
    customerMobileNumber = newMobileNumber;
    notifyListeners();
  }

  void sell() {
    // Perform selling logic here
  }
}

class SellToCustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 176, 210, 237),
      appBar: AppBar(
        title: Text('Sell to Customer'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => SellViewModel(),
        child: Consumer<SellViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'List of Controllers',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: viewModel.controllers.length,
                      itemBuilder: (context, index) {
                        final controller = viewModel.controllers[index];
                        final isSelected = viewModel.isSelected(controller);

                        return Card(
                          child: ListTile(
                            style: ListTileStyle.drawer,
                            trailing: Checkbox(
                              value: isSelected,
                              onChanged: (value) {
                                viewModel.toggleSelection(controller);
                              },
                            ),
                            title: Text(controller.name),
                            subtitle: Text(controller.imeiNumber),
                            leading: CircleAvatar(
                              child: Text(controller.name[0]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Sell To:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton<String>(
                            underline: Container(),
                            borderRadius: BorderRadius.circular(10),
                            value: viewModel.selectedCustomerType,
                            onChanged: (newValue) =>
                                viewModel.updateCustomerType(newValue!),
                            items: viewModel.customerTypes
                                .map((type) => DropdownMenuItem<String>(
                                      value: type.name,
                                      child: Text(type.name),
                                    ))
                                .toList(),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //  color: Colors.white,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text(
                          'Mobile Number: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 250,
                          child: TextFormField(
                            onChanged: (newValue) =>
                                viewModel.updateCustomerMobileNumber(newValue),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              labelText: 'Mobile Number',
                              hintText: 'Enter Mobile Number',
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set your desired corner radius here
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            // maxLength: 10,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _showAlert(context);
                          },
                          icon: Icon(Icons.check),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.sell();
                      // Navigate or perform other actions here
                    },
                    child: Text('Sell To Controller'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.fromLTRB(16, 16, 16, 0), // Adjust padding
          title: Container(
            color: Colors.blue,
            child: Text(
              'Mobile number check',
            ),
          ),
          content:
              Text('There are no account this number, Also Create new Account'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }
}
