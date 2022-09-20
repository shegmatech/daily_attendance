import 'package:flutter/material.dart';

class markAttendance extends StatefulWidget {
  const markAttendance({Key? key}) : super(key: key);

  @override
  State<markAttendance> createState() => _markAttendanceState();
}

class _markAttendanceState extends State<markAttendance> {

  bool isAttendance = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: (){
            //TODO: show dialog box for attendance marked and change the signin buttin to signout with redBG
            setState(() {
              isAttendance = false;
            });
            print(isAttendance);
          },
          child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(shape: BoxShape.circle, color: isAttendance? Colors.green : Colors.red)
          ))
    );
  }
}
