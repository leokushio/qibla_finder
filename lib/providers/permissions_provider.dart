
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsProvider extends ChangeNotifier{

  bool hasLocationPermission = false;

  Future getPermission() async{
    if(await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if(status.isGranted) {
        hasLocationPermission = true;
      } else {
        Permission.location.request().then((value) => hasLocationPermission = (value == PermissionStatus.granted));
      }
    } 
    notifyListeners();
  }
}