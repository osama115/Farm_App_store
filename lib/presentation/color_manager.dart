import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ColorManager{
  static const MaterialColor bl = const MaterialColor(0x8A000000,<int, Color>{
    50: Color(0xff000000),
    700: Color(0x8A000000)
  });

  // static const MaterialColor black54 =  MaterialColor(0x8A000000,<int, Color>{});

  static Color black54 =Colors.black54;
  static Color blackwith =Colors.black.withOpacity(0.4);
  static Color whitewith =Colors.white.withOpacity(0.7);
  static Color primary = Color(0xffED9728);
  static Color darkGrey =const Color(0xff525252);
  static Color grey =const Color(0xff737477);
  static Color grey300 = Colors.grey[300]!;
  static Color lightGrey =const Color(0xff9E9E9E);
  static Color transparent =Colors.transparent;

  //new
  static Color darkPrimary =const Color(0xffd17d11);
  static Color lightPrimary =const Color(0xccd17d11);
  static Color grey1 =const Color(0xff707070);
  static Color grey2 =const Color(0xff797979);
  static Color grey30 =Colors.grey.shade300;
  static Color white =const Color(0xffFFFFFF);
  static Color red =const Color(0xffe61f34);
  static Color black =const Color(0xff000000);
  static Color blue =const Color(0xff2196F3);
  static Color blue1 =Colors.blue;
  static Color yellow =Colors.yellow[700]!;
  static Color yellow8 =Colors.yellow[800]!;
  static Color green =Colors.green;
  static Color greenSh =Colors.green.shade50;
  static Color greenSh4 =Colors.green.shade400;
  static Color greenSh7 =Colors.green.shade700;



}