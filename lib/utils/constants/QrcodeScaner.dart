import 'package:flutter/material.dart';
import 'package:oro_2024/utils/constants/Permission.dart';
import 'package:oro_2024/utils/constants/QRcodeScannerAction.dart';
import 'package:permission_handler/permission_handler.dart';

class QRCodescaner extends StatefulWidget {
  const QRCodescaner({super.key});

  @override
  State<QRCodescaner> createState() => _QRCodescanerState();
}

class _QRCodescanerState extends State<QRCodescaner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QRCode scaner'),
      ),
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: TextButton(
          child: Text('QR Code'),
          onPressed: () {
            PermissionClass permission = PermissionClass();
            permission.checkPermission(context, Permission.camera);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QRcodeScannerAction()));
          },
        ),
      )),
    );
  }
}
