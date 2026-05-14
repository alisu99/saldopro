import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saldopro/colors/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget ItemDash(String nome, Icon icon, String money) {
  return Container(
    padding: .all(10),
    width: 150,
    decoration: BoxDecoration(
      color: AppColor.backgroundCard,
      borderRadius: .circular(10),
    ),
    child: Column(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          spacing: 5,
          children: [
            Container(
              padding: .all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.backgroundDark,
              ),

              child: icon,
            ),

            Text(
              nome,
              style: TextStyle(
                color: AppColor.textColorPrimary,
                fontSize: 16,
                // fontWeight: .bold,
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: .end,
          children: [
            Text(
              'R\$ $money',
              style: TextStyle(
                color: AppColor.textColorPrimary,
                fontSize: 18,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget itemAcoes(String nome, Icon icon) {
  return Container(
    padding: .all(1.5),
    decoration: BoxDecoration(
      borderRadius: .circular(10),
      color: AppColor.backgroundCard,
      gradient: LinearGradient(
        colors: [AppColor.gradientRed, AppColor.gradientGreen],
      ),
    ),
    child: Container(
      padding: .all(10),
      width: 120,
      decoration: BoxDecoration(
        color: AppColor.backgroundCard,
        borderRadius: .circular(10),
      ),
      
      child: Column(
        mainAxisAlignment: .spaceAround,
        children: [
          icon,
          Text(
            nome,
            style: TextStyle(
              color: AppColor.textColorPrimary,
              fontSize: 16,
              fontWeight: .bold,
            ),
          ),
        ],
      ),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List items = [
      ItemDash(
        'Entradas',
        Icon(
          Icons.attach_money_rounded,
          color: AppColor.textColorPrimary,
          size: 25,
        ),
        '145,80',
      ),
      ItemDash(
        'Saídas',
        Icon(
          Icons.attach_money_rounded,
          color: AppColor.textColorPrimary,
          size: 25,
        ),
        '200,00',
      ),
      ItemDash(
        'Saldo',
        Icon(Icons.wallet, color: AppColor.textColorPrimary, size: 25),
        '475,80',
      ),
    ];

    final List acoes = [
      itemAcoes(
        'Novo',
        Icon(Icons.add, color: AppColor.textColorPrimary, size: 25),
      ),
      itemAcoes(
        'Metas',
        Icon(
          Icons.bar_chart_outlined,
          color: AppColor.textColorPrimary,
          size: 25,
        ),
      ),
      itemAcoes(
        'Categorias',
        Icon(Icons.category, color: AppColor.textColorPrimary, size: 25),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .all(10),

            // coluna principal
            child: Column(
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

                Column(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
