import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:awesome_dialog/awesome_dialog.dart';




final Color mainButtonColor = HexColor('#0E0BC2');
final Color overlayColor = HexColor('#928888');
final Color signUpwithGoogleColor = HexColor('#CACACA');
final Color logoBG = HexColor('#FFFCFC');
final Color NavBarColor = HexColor('#E2DADA');

//a widget that returns an icona and a text
// Widget login(IconData icon) {
//   return Container(
//     height: 50,
//     width: 115,
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, size: 24),
//         TextButton(onPressed: () {}, child: Text('Login')),
//       ],
//     ),
//   );
// }


Widget userInput(TextEditingController userInput, String hintTitle, TextInputType keyboardType, bool obscureText ) {
  return Container(
    height: 55,
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(color: Colors.blueGrey.shade200, borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
      child: TextField(
        controller: userInput,
        autocorrect: false,
        enableSuggestions: false,
        autofocus: false,
        decoration: InputDecoration.collapsed(
          hintText: hintTitle,
          hintStyle: TextStyle(fontSize: 18, color: Colors.white70, fontStyle: FontStyle.italic),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    ),
  );
}

//App BG
appBG(){
  return const Positioned.fill(
    child: Image(
      image: AssetImage(''),
      //image: AssetImage('assets/BG.jpg'),
      fit: BoxFit.cover,
    ),
  );
}


//awesome dialog trial

AwesomeDialog myAwesomeDialog(String Title, String Description, BuildContext context, DialogType dialogType, AnimType animType,  btnCancelOnPress, btnOkOnPress ){
  return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: animType,
      title: Title,
      desc: Description,
      btnCancelOnPress: () => btnCancelOnPress,
      btnOkOnPress: () => btnOkOnPress,
  )..show();
}