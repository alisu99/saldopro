import 'package:flutter/material.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/views/utils/homePageUtils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .all(10),

            // coluna principal
            child: Column(
              spacing: 30,
              children: [
                Row(
                  mainAxisAlignment: .end,
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.refresh,
                      size: 25,
                      color: AppColor.textColorPrimary,
                    ),
                    Icon(
                      Icons.notifications,
                      size: 25,
                      color: AppColor.textColorPrimary,
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://admin.faculdademalta.edu.br/media/profile_images/71cca382-04c5-43f0-b026-df41a99214a0.jpg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: 10,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 10 * 100,
                          padding: .all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColor.gradientRed,
                                AppColor.gradientGreen,
                              ],
                            ),
                            borderRadius: .circular(10),
                          ),

                          child: Row(
                            spacing: 5,
                            children: [
                              Icon(
                                Icons.handshake,
                                size: 40,
                                color: AppColor.textColorPrimary,
                              ),

                              Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    'Olá, Alisson',
                                    style: TextStyle(
                                      color: AppColor.branco,
                                      fontSize: 18,
                                      height: 0,
                                    ),
                                  ),
                                  Text(
                                    'Bem vindo ao SaldoPro!',
                                    style: TextStyle(
                                      color: AppColor.branco,
                                      fontSize: 18,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 10 * 100,
                      padding: .all(20),
                      decoration: BoxDecoration(
                        color: AppColor.backgroundCard,
                        borderRadius: .circular(10),
                      ),

                      child: Row(
                        spacing: 10,
                        children: [
                          Container(
                            padding: .all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.gradientGreen,
                            ),
                            child: Icon(
                              Icons.monetization_on,
                              size: 25,
                              color: AppColor.textColorPrimary,
                            ),
                          ),

                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                'Você gastou',
                                style: TextStyle(
                                  color: AppColor.branco,
                                  fontSize: 14,
                                  fontWeight: .bold,
                                ),
                              ),
                              Text(
                                'R\$ 145,55',
                                style: TextStyle(
                                  color: AppColor.branco,
                                  fontSize: 25,
                                  fontWeight: .bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  spacing: 5,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Geral',
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 15,
                            fontWeight: .bold,
                          ),
                        ),
                        Text(
                          'Ver mais >',
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 15,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: .horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        itemCount: items.length,
                        itemBuilder: (context, index) => items[index],
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: 5,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Ações',
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 15,
                            fontWeight: .bold,
                          ),
                        ),
                        Text(
                          'Ver mais >',
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 15,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: .horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        itemCount: acoes.length,
                        itemBuilder: (context, index) => acoes[index],
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: 5,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Recentes',
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 15,
                            fontWeight: .bold,
                          ),
                        ),
                        Text(
                          'Ver mais >',
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 15,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 4),
                        itemCount: itensRecentes.length,
                        itemBuilder: (context, index) => itensRecentes[index],
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: 5,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Categorias',
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 15,
                            fontWeight: .bold,
                          ),
                        ),
                        Text(
                          'Ver mais >',
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 15,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      padding: .all(20),
                      decoration: BoxDecoration(
                        color: AppColor.backgroundCard,
                        borderRadius: .circular(10),
                      ),
                      child: SizedBox(
                        height: 130,
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: listaCategorias.length,
                          separatorBuilder: (context, index) => SizedBox(height: 12,),
                          itemBuilder: (context, index) => listaCategorias[index],
                            
                            

                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
