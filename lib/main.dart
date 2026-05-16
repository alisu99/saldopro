import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/home/homePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Transacoes(transacoes: [])),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColor.backgroundDark,
        appBarTheme: AppBarThemeData(
          backgroundColor: AppColor.backgroundCard,
          titleTextStyle: TextStyle(color: AppColor.branco, fontSize: 16, fontWeight: .bold),
          // centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.branco),
          shape: RoundedRectangleBorder(
            borderRadius: .only(bottomLeft: .circular(10), bottomRight: .circular(10))
          )
        )
      ),

      routes: {'home': (context) => HomePage()},

      initialRoute: 'home',
    );
  }
}
