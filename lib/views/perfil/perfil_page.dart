import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/auth/usuario.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usuario = context.watch<Usuario>();
    return Scaffold(
      appBar: AppBar(title: Text('Meu perfil')),
      body: SafeArea(
        child: Padding(
          padding: .all(10),
          child: Column(
            spacing: 20,
            children: [
              Container(
                padding: .all(10),
                width: .infinity,
                decoration: BoxDecoration(
                  color: AppColor.backgroundCard,
                  borderRadius: .circular(10),
                ),

                child: Row(
                  spacing: 5,
                  crossAxisAlignment: .center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://admin.faculdademalta.edu.br/media/profile_images/71cca382-04c5-43f0-b026-df41a99214a0.jpg',
                          ),
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          '${usuario.firstName} ${usuario.lastName}',
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontWeight: .bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          usuario.email.toString(),
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontWeight: .bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: .all(20),
                width: .infinity,
                decoration: BoxDecoration(
                  color: AppColor.backgroundCard,
                  borderRadius: .circular(10),
                ),

                child: Column(
                  spacing: 15,
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize: 16,
                                fontWeight: .bold,
                              ),
                            ),
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              SizedBox(
                                width: 16 * 10,
                                child: Text(
                                  usuario.email.toString(),
                                  style: TextStyle(color: AppColor.texto),
                                  maxLines: 1,
                                  overflow: .ellipsis,
                                  textAlign: .end,
                                ),
                              ),

                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 15,
                                color: AppColor.gainsboro,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    InkWell(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Telefone',
                              style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize: 16,
                                fontWeight: .bold,
                              ),
                            ),
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              SizedBox(
                                width: 16 * 10,
                                child: Text(
                                  usuario.telefone.toString(),
                                  style: TextStyle(color: AppColor.texto),
                                  maxLines: 1,
                                  overflow: .ellipsis,
                                  textAlign: .end,
                                ),
                              ),

                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 15,
                                color: AppColor.gainsboro,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    InkWell(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'CPF',
                              style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize: 16,
                                fontWeight: .bold,
                              ),
                            ),
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              SizedBox(
                                width: 16 * 10,
                                child: Text(
                                  usuario.cpf.toString(),
                                  style: TextStyle(color: AppColor.texto),
                                  maxLines: 1,
                                  overflow: .ellipsis,
                                  textAlign: .end,
                                ),
                              ),

                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 15,
                                color: AppColor.gainsboro,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    InkWell(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Endereço',
                              style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize: 16,
                                fontWeight: .bold,
                              ),
                            ),
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              SizedBox(
                                width: 16 * 10,
                                child: Text(
                                  usuario.endereco.toString(),
                                  style: TextStyle(color: AppColor.texto),
                                  maxLines: 1,
                                  overflow: .ellipsis,
                                  textAlign: .end,
                                ),
                              ),

                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 15,
                                color: AppColor.gainsboro,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Divider(color: AppColor.backgroundProgress),

                    InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: AppColor.backgroundCard,
                            content: Text(
                              'Tem certeza que deseja encerrar a sessão?',
                              style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize: 18,
                              ),
                            ),
                            actions: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    color: AppColor.textColorPrimary,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),

                              GestureDetector(
                                onTap: () async {
                                  await usuario.logout();
                                  if (context.mounted) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      'login',
                                    );
                                  }
                                },
                                child: Text(
                                  'Sim, quero sair',
                                  style: TextStyle(
                                    color: AppColor.textColorPrimary,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Encerrar sessão',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),

                          Icon(Icons.logout_outlined, color: Colors.red),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
