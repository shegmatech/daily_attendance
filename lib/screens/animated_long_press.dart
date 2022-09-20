import 'package:flutter/material.dart';


class markAttendance extends StatefulWidget {
  @override
  markAttendanceState createState() => markAttendanceState();
}

class markAttendanceState extends State<markAttendance>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => controller.forward(),
      onTapUp: (_) {
        if (controller.status == AnimationStatus.forward) {
          controller.reverse();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(shape: BoxShape.circle,),
            child: const CircularProgressIndicator(
              value: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(shape: BoxShape.circle,),
            child: CircularProgressIndicator(
              value: controller.value,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
          const Icon(Icons.add)
        ],
      ),
    );
  }
}