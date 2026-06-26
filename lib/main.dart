import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/auth/usuario.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/auth/login_page.dart';
import 'package:saldopro/views/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final usuario = Usuario();
  await usuario.verificarAutenticacao();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Transacoes(transacoes: [])),
        ChangeNotifierProvider(create: (_) => Categorias(categorias: [])),
        ChangeNotifierProvider.value(value: usuario),
      ],
      child: MainApp(autenticado: usuario.isAutenticado),
    ),
  );
}

class MainApp extends StatelessWidget {
  final bool autenticado;
  const MainApp({super.key, required this.autenticado});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColor.backgroundDark,
        appBarTheme: AppBarThemeData(
          scrolledUnderElevation: 0,
          backgroundColor: AppColor.backgroundDark,
          toolbarHeight: 80,
          titleTextStyle: TextStyle(
            color: AppColor.branco,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.branco),
        ),
      ),
      routes: {
        'login': (context) => LoginPage(),
        'home': (context) => HomePage(),
      },
      initialRoute: autenticado ? 'home' : 'login',
    );
  }
}
