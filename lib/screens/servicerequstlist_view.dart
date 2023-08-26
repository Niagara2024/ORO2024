import 'package:flutter/material.dart';
import 'package:oro_2024/screens/service_requestViewmodel.dart';
import 'package:oro_2024/screens/servicerequestcart.dart';
import 'package:provider/provider.dart';

class ServiceRequestlistView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Request List'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              final contactViewModel =
                  Provider.of<ServiceRequestViewModel>(context, listen: false);
              contactViewModel.refreshContacts();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle the action of the first button
                },
                child: Text(
                  'Total\n64',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                width: 10,
              ), // Add some spacing between the buttons
              ElevatedButton(
                onPressed: () {
                  // Handle the action of the second button
                },
                child: Text(
                  'open\n22',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle the action of the first button
                },
                child: Text(
                  'closed\n11',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                width: 10,
              ), // Add some spacing between the buttons
              ElevatedButton(
                onPressed: () {
                  // Handle the action of the second button
                },
                child: Text(
                  'In-progres\n34',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<ServiceRequestViewModel>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.serviceRequest.length,
                  itemBuilder: (context, index) {
                    return ServiceRequestCard(
                        serviceRequestlist: model.serviceRequest[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
