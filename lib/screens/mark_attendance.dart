import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';



class markAttendance extends StatefulWidget {
  const markAttendance({Key? key}) : super(key: key);

  @override
  State<markAttendance> createState() => _markAttendanceState();
}

class _markAttendanceState extends State<markAttendance> {

  Future myLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();

    latitude = _locationData.latitude;
    longitude = _locationData.longitude;
    latitude = _locationData.accuracy;

    //by default, the 3 variables above were initialized with 0.0 values, so
    //setState is used here so that the UI can be redrawn to show the new state of the variables since new values have been assigned to them
    setState(() {

    });
    print("latitude: $latitude, longitude: $longitude, accuracy: $accuracy");
  }

  @override
  void initState() {
    super.initState();
    myLocation();
  }

  double? latitude=0.0;
  double? longitude=0.0;
  double? accuracy=0.0;
  bool _isAttendance = false;
//handle tap function
  void _handleTap() {
      setState(() {
        _isAttendance = !_isAttendance;
        if(_isAttendance == true){
          AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'Confirm',
            desc: 'Are you sure you want to sign in',
            btnCancelOnPress: () { Navigator.pop(context);},
            btnOkOnPress: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                title: "SignIn Successful",
                btnOkOnPress: (){Navigator.pop(context);},
              );
            },
          ).show();
        }
        if(_isAttendance == false){
          AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'Confirm',
            desc: 'Are you sure you want to sign out',
            btnCancelOnPress: () { Navigator.pop(context);},
            btnOkOnPress: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                title: "Signed Out",
                btnOkOnPress: (){Navigator.pop(context);},
              );
            },
          ).show();
        }
        print(_isAttendance);
      });
  }

//handle tap end
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: GestureDetector(
                  onTap: _handleTap,
                  child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isAttendance
                              ? Colors.green
                              : Colors
                                  .red) //color: isAttendance? Colors.green : Colors.red
                      ))),
          const SizedBox(
            height: 20.0,
          ),
          Text("$longitude,$latitude,$accuracy")
        ],
      ),
    );
  }
}
