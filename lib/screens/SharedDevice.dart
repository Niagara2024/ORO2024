// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeviceListViewModel extends ChangeNotifier {
  List<Device> _devices = [
    Device(
        areaName: 'chennai',
        name: 'venkatesan',
        imeiNumber: '98767654432',
        profileImage: 's',
        deviceName: 'pump'),
    Device(
        areaName: 'covai',
        name: 'tamil',
        imeiNumber: '6987654321',
        profileImage: 'T',
        deviceName: 'pump'),
    Device(
        areaName: 'Erode',
        name: 'Arun',
        imeiNumber: '8767646545',
        profileImage: 'v',
        deviceName: 'Smart'),
    Device(
        areaName: 'chennai',
        name: 'venugopal',
        imeiNumber: '1214324324',
        profileImage: 's',
        deviceName: 'pump'),
    Device(
        areaName: 'covai',
        name: 'tamil selvan',
        imeiNumber: '994477623',
        profileImage: 'T',
        deviceName: 'pump'),
    Device(
        areaName: 'Erode',
        name: 'AKIL',
        imeiNumber: '987664545215',
        profileImage: 'v',
        deviceName: 'Smart'),
    Device(
        areaName: 'covai',
        name: 'Siva prakash',
        imeiNumber: '994477623',
        profileImage: 'T',
        deviceName: 'pump'),
    Device(
        areaName: 'ooty',
        name: 'Siva',
        imeiNumber: '87664545215',
        profileImage: 'v',
        deviceName: 'Smart'),
    Device(
        areaName: 'covai',
        name: 'prakash',
        imeiNumber: '97664545215',
        profileImage: 'v',
        deviceName: 'oro'),
  ];
  List<Device> _filteredDevices = [];

  List<Device> get devices =>
      _filteredDevices.isEmpty ? _devices : _filteredDevices;

  void searchDevices(String query) {
    if (query.isEmpty) {
      _filteredDevices.clear();
    } else {
      _filteredDevices = _devices.where((device) {
        final lowerQuery = query.toLowerCase();
        return device.name.toLowerCase().startsWith(lowerQuery) ||
            device.imeiNumber.toLowerCase().contains(lowerQuery) ||
            device.areaName.toLowerCase().startsWith(lowerQuery) ||
            device.deviceName.toLowerCase().startsWith(lowerQuery);
      }).toList();
    }
    notifyListeners();
  }
}

class DeviceListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DeviceListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Device List'),
      ),
      body: Column(
        children: [
          SearchBar(
            onSearch: viewModel.searchDevices,
          ),
          Expanded(
            child: DeviceList(),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBar({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
          hintText: 'Search devices...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class DeviceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DeviceListViewModel>(context);

    return ListView.builder(
      itemCount: viewModel.devices.length,
      itemBuilder: (context, index) {
        final device = viewModel.devices[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${device.name[0]}'),
            ),
            title: Text(device.name),
            subtitle: Text('IMEI: ${device.imeiNumber}'),
            trailing: Text('Area: ${device.areaName}'),
          ),
        );
      },
    );
  }
}

class Device {
  final String name;
  final String imeiNumber;
  final String areaName;
  final String deviceName;
  final String profileImage;

  Device({
    required this.name,
    required this.imeiNumber,
    required this.areaName,
    required this.deviceName,
    required this.profileImage,
  });
}
