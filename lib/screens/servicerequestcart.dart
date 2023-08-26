import 'package:flutter/material.dart';
import 'package:oro_2024/model/service_requestmodel.dart';
import 'package:oro_2024/screens/servicerequstlist_view.dart';

class ServiceRequestCard extends StatefulWidget {
  final ServiceRequest serviceRequestlist;

  const ServiceRequestCard({Key? key, required this.serviceRequestlist})
      : super(key: key);

  @override
  _ServiceRequestCardState createState() => _ServiceRequestCardState();
}

class _ServiceRequestCardState extends State<ServiceRequestCard> {
  Image trailingIcon = Image.asset('assets/images/closed.png'); // Default icon
  String serviceStatus = ''; // Value fetched from API

  @override
  void initState() {
    super.initState();
    // Simulate fetching value from API
    _fetchApiValue();
  }

  @override
  Widget build(BuildContext context) {
    String msg =
        "${widget.serviceRequestlist.number}\n${widget.serviceRequestlist.imeinum}\n${widget.serviceRequestlist.message}";
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(widget.serviceRequestlist.name[0]),
        ),
        title: Text(widget.serviceRequestlist.name),
        subtitle: Text(msg),
        trailing: GestureDetector(
          onLongPress: () {
            _showOptionsDialog(context);
          },
          child: trailingIcon,
        ),
      ),
    );
  }

  void _fetchApiValue() {
    // Simulate fetching the value from API
    serviceStatus =
        'serviceRequestlist.requetstatus'; // For example, 'email' fetched from API
    _updateIcon();
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
        return AlertDialog(
          title: Text('Select an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Image.asset('assets/images/open-sign.png'),
                title: Text('open'),
                onTap: () {
                  // Update the API value here
                  serviceStatus = 'open';
                  _updateIcon();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset('assets/images/closed.png'),
                title: Text('close'),
                onTap: () {
                  // Update the API value here
                  serviceStatus = 'close';
                  _updateIcon();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset('assets/images/work-in-progress.png'),
                title: Text('inprogress'),
                onTap: () {
                  // Update the API value here
                  serviceStatus = 'inprogress';
                  _updateIcon();
                  Navigator.pop(context);
                },
              ),
              // Add more options as needed
            ],
          ),
        );
      },
    );
  }
}
