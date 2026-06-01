import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saldopro/colors/colors.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        Text('Alisson Gustavo', style: TextStyle(color: AppColor.textColorPrimary, fontWeight: .bold, fontSize: 16),),
                        Text('alissonsts910@gmail.com', style: TextStyle(color: AppColor.textColorPrimary, fontWeight: .bold, fontSize: 10),),
                      ],
                    )
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

                child: Column(

                  children: [
                    
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
