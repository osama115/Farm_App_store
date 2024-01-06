import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegitable_app_test1/pages/home_page.dart';
import 'package:vegitable_app_test1/pages/welcome_page.dart';
import 'package:vegitable_app_test1/presentation/color_manager.dart';
import 'package:vegitable_app_test1/presentation/string_manager.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.argicPlant,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.green),
        useMaterial3: true,
        textTheme:GoogleFonts.mulishTextTheme(),
      ),
      home:const WelcomPage(),
    );
  }
}

