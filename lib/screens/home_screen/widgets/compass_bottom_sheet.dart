import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qibla_finder/providers/permissions_provider.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:qibla_finder/screens/home_screen/widgets/qibla_compass.dart';



Future<dynamic> compassBottomSheet(BuildContext context) {
  final bool hasLocationPermission = Provider.of<PermissionsProvider>(context, listen: false).hasLocationPermission;
  final deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
    return showModalBottomSheet(
        showDragHandle: true,
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
            child: !hasLocationPermission 
            ? ElevatedButton(onPressed: (){
              context.read<PermissionsProvider>().getPermission();
              }, 
              child: const Text('Allow Location')) 
            : FutureBuilder(
              future: deviceSupport, 
              builder: (_, AsyncSnapshot<bool?> snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) 
                  {return const CircularProgressIndicator();}
                if (snapshot.hasError)
                  {return Center(
                    child: Text("Error: ${snapshot.error.toString()}"),
                );
                }

            if (snapshot.data!)
              {
                return const QiblahCompassWidget();
              }else{ 
                return Container();
              }
              }
              ),
          ),
        ),
      );
  }