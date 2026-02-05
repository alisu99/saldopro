import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saldopro/colors/cores.dart';
import 'package:saldopro/pages/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.verdeTransparente,
          toolbarHeight: 100,
          shape: RoundedRectangleBorder(
            borderRadius: .only(bottomLeft: .circular(10), bottomRight: .circular(10))
          ),
        )
      ),

      routes: {
        'homepage': (context) => HomePage(),
      },

      initialRoute: 'homepage',
      
    );
  }
}
