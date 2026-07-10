import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/auth/usuario.dart';
import 'package:saldopro/views/home/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> abrirLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Não foi possível abrir o link');
    }
  }

  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final usuario = context.watch<Usuario>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .all(10),
          child: Column(
            spacing: 10,
            mainAxisAlignment: .center,
            children: [
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'Saldo',
                    style: TextStyle(
                      color: AppColor.textColorPrimary,
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    'Pro',
                    style: TextStyle(
                      color: AppColor.yellow,
                      fontSize: 35,
                      fontWeight: .w900,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: AppColor.branco, fontWeight: .bold),
                decoration: InputDecoration(
                  hintText: 'email@exemplo.com',
                  hintStyle: TextStyle(color: AppColor.backgroundProgress),
                  filled: true,
                  fillColor: AppColor.backgroundCard,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: .circular(10),
                  ),

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: .circular(10),
                  ),
                ),
                cursorColor: AppColor.branco,
              ),

              TextField(
                controller: senhaController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: AppColor.branco, fontWeight: .bold),

                decoration: InputDecoration(
                  hintText: 'Senha',
                  hintStyle: TextStyle(color: AppColor.backgroundProgress),
                  filled: true,
                  fillColor: AppColor.backgroundCard,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: .circular(10),
                  ),

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: .circular(10),
                  ),
                ),
                cursorColor: AppColor.branco,
              ),

              SizedBox(height: 20),

              usuario.isCarregando
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppColor.celestialBlue,
                        
                      ),
                    )
                  : GestureDetector(
                      onTap: usuario.isCarregando
                          ? null
                          : () async {
                              await usuario.autenticar(
                                emailController.text,
                                senhaController.text,
                              );

                              if (!context.mounted) return;

                              if (usuario.isAutenticado) {
                                Navigator.pushReplacementNamed(context, 'home');
                              } else if (usuario.erro != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(usuario.erro!),
                                    backgroundColor: Colors.red,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            },
                      child: Container(
                        width: .infinity,
                        padding: .all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColor.gradientBlue,
                              AppColor.celestialBlue,
                            ],
                          ),
                          borderRadius: .circular(10),
                        ),

                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              'Entrar',
                              style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontWeight: .bold,
                                fontSize: 16,
                              ),
                            ),

                            Icon(
                              Icons.login,
                              color: AppColor.gradientBlue,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  GestureDetector(
                    child: Text(
                      'Esqueci minha senha',
                      style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      abrirLink("https://api.agdev.com.br/api/registre-se/");
                    },
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
