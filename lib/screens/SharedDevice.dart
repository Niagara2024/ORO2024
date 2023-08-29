// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeviceListViewModel extends ChangeNotifier {
  List<Device> _devices = [
    Device(
        areaName: 'chennai',
        name: 'venkatesan',
        imeiNumber: '124356987654321',
        profileImage: 's',
        deviceName: 'pump'),
    Device(
        areaName: 'covai',
        name: 'tamil',
        imeiNumber: '124356987654321',
        profileImage: 'T',
        deviceName: 'pump'),
    Device(
        areaName: 'Erode',
        name: 'Arun',
        imeiNumber: '124356987654321',
        profileImage: 'v',
        deviceName: 'Smart'),
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
        return device.name.toLowerCase().contains(lowerQuery) ||
            device.imeiNumber.toLowerCase().contains(lowerQuery) ||
            device.areaName.toLowerCase().contains(lowerQuery) ||
            device.deviceName.toLowerCase().contains(lowerQuery);
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
        title: Text('Device List'),
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
        return ListTile(
          leading: CircleAvatar(
            child: Text('${device.name[0]}'),
          ),
          title: Text(device.name),
          subtitle: Text('IMEI: ${device.imeiNumber}'),
          trailing: Text('Area: ${device.areaName}'),
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
