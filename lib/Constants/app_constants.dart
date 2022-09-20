import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final Color mainButtonColor = HexColor('#0E0BC2');
final Color overlayColor = HexColor('#928888');
final Color signUpwithGoogleColor = HexColor('#CACACA');
final Color logoBG = HexColor('#FFFCFC');
final Color NavBarColor = HexColor('#E2DADA');

appBG(){
  return const Positioned.fill(
    child: Image(
      image: AssetImage(''),
      //image: AssetImage('assets/BG.jpg'),
      fit: BoxFit.cover,
    ),
  );
}