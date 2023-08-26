import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oro_2024/utils/theme.dart';
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
          Container(
            padding: EdgeInsets.all(5),
            width: double.infinity,
            child: MultipleChoice(name: const [
              'Total \n 42',
              'open \n 22',
              'close \n 12',
              'Progress \n 12'
            ]),
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
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 10,
                          end: 10), // Add leading and trailing padding
                      child: ServiceRequestCard(
                          serviceRequestlist: model.serviceRequest[index]),
                    );
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

class ServiceRequestViewModel extends ChangeNotifier {
  List<ServiceRequest> serviceRequest = [
    ServiceRequest(
        'John Doe', '+1234567890', 'Hello there!', '8976543223456', 2),
    ServiceRequest(
        'Jane roe', '+9876543210', 'Hi! How are you?', '8976543223453', 2),
    ServiceRequest(
        'Jane Smith', '+9876543210', 'Hi! How are you?', '89765432234567', 2),
    ServiceRequest(
        'Jane ', '+9876543210', 'Hi! How are you?', '89765432234531', 2),
    ServiceRequest(
        'Smith', '+9876543210', 'Hi! How are you?', '8976543223459', 2),
  ];

  void refreshContacts() {
    notifyListeners();
  }
}

class ServiceRequest {
  final String name;
  final String number;
  final String message;
  final String imeinum;
  final int requetstatus;

  ServiceRequest(
      this.name, this.number, this.message, this.imeinum, this.requetstatus);
}

class MultipleChoice extends StatefulWidget {
  List<String> name;
  MultipleChoice({Key? key, required this.name});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<String> selection = {'0'};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Set borderRadius to zero
          ),
        ),
        alignment: Alignment.center,
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        ),
      ),
      showSelectedIcon: false,
      segments: <ButtonSegment<String>>[
        for (var i in widget.name)
          ButtonSegment<String>(value: '$i', label: Text(i)),
      ],
      selected: selection,
      onSelectionChanged: (Set<String> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: false,
    );
  }
}
