import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_attendance/Constants/locationData.dart';


class markAttendance extends StatefulWidget {
  const markAttendance({Key? key}) : super(key: key);

  @override
  State<markAttendance> createState() => _markAttendanceState();
}

class _markAttendanceState extends State<markAttendance> {
  bool _isAttendance = true;

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
          Text("Location here ${myLocation()}")
        ],
      ),
    );
  }
}
