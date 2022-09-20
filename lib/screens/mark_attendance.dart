import 'package:flutter/material.dart';

class markAttendance extends StatefulWidget {
  const markAttendance({Key? key}) : super(key: key);

  @override
  State<markAttendance> createState() => _markAttendanceState();
}

class _markAttendanceState extends State<markAttendance> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: (){},
          child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(shape: BoxShape.circle,)
          ))
    );
  }
}
