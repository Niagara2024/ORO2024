import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionClass {
  void checkPermission(BuildContext context, Permission permission) async {
    final status = await permission.request();

    if (status.isGranted) {
      print('Permission Granted: ${permission.toString()}');
    } else {
      if (await permission.request().isGranted) {
        print('Permission was granted: ${permission.toString()}');
      } else {
        showAlertDialog(context);
      }
    }
  }

  void showAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Permission Denied'),
        content: const Text('Please allow access to the application.'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => openAppSettings(),
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
// To USE   PermissionClass permission = PermissionClass();
         // permission.checkPermission(context, Permission.location);