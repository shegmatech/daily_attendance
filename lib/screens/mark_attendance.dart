import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class markAttendance extends StatefulWidget {
  const markAttendance({Key? key}) : super(key: key);

  @override
  State<markAttendance> createState() => _markAttendanceState();
}

class _markAttendanceState extends State<markAttendance> {
  bool _isAttendance = true;

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

//handle tap function
  void _handleTap() {
    setState(() {
      _isAttendance = !_isAttendance;
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
          SizedBox(height: 20.0,),
          GestureDetector(
            onTap: getLocation,
            child: Text("Location here"),
          )
        ],
      ),
    );
  }
}
