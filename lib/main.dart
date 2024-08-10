import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_suitmedia/pages/first_page.dart';
import 'package:test_suitmedia/pages/second_page.dart';
import 'package:test_suitmedia/pages/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      getPages: [
        GetPage(name: '/', page: () => FirstPage()),
        GetPage(name: '/second', page: () => SecondPage()),
        GetPage(name: '/third', page: () => ThirdPage()),
      ],
    );
  }
}
