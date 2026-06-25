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
                padding: .all(10),
                width: .infinity,
                decoration: BoxDecoration(
                  color: AppColor.backgroundCard,
                  borderRadius: .circular(10),
                ),

                child: Column(children: [
                    
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'login',
                    (route) => EditableText.debugDeterministicCursor,
                  );
                },
                child: Container(
                  width: .infinity,
                  padding: .all(10),
                  decoration: BoxDecoration(
                    color: AppColor.gradientRed,
                    borderRadius: .circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Encerrar Sessão',
                        style: TextStyle(
                          color: AppColor.branco,
                          fontSize: 16,
                          fontWeight: .bold,
                        ),
                      ),
                      Icon(Icons.logout, size: 25, color: AppColor.branco),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
