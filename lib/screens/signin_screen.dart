import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_attendance/Constants/reusables.dart';
import 'package:flutter/material.dart';

import 'mark_attendance.dart';



class SigninScreen extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(
              'https://i.pinimg.com/564x/cb/9c/09/cb9c09d54f420cb49b942a58b9a3e0fb.jpg'),
            ),
          ),
        child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/4),
                      userInput(
                          emailController, 'Email',
                          TextInputType.emailAddress,
                      false),


                      userInput(
                          passwordController,
                          'Password',
                          TextInputType.visiblePassword,
                      true),
                      Container(
                        height: 55,
                        // for an exact replicate, remove the padding.
                        // pour une réplique exact, enlever le padding.
                        padding: const EdgeInsets.only(
                            top: 5, left: 70, right: 70),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          color: Colors.red.shade800,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_) => markAttendance()));
                            //Provider.of<Auth>(context, listen: false).login(emailController.text, passwordController.text);
                            //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AttendanceScreen()));
                          },
                          child: const Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,),),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // const Center(child: Text('Forgot password ?'),), // i just removed this
                      const Divider(thickness: 2, color: Colors.red),

                    ],
                  ),
                ),
              ),
        );
  }
}
