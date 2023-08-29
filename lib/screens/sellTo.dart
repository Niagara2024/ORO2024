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
                        DropdownButton<String>(
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
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      onChanged: (newValue) =>
                          viewModel.updateCustomerMobileNumber(newValue),
                      decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          hintText: 'Enter Mobile Number',
                          labelStyle: TextStyle(color: Colors.black)),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
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
}
