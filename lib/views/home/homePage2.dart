import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/home/adicionarTransacaoPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;
  void abrirolho() {
    setState(() {
      isVisible = isVisible ? false : true;
    });
  }

  @override
  void initState() {
    super.initState();
    // Quando a tela abre, busca os dados da API
    Future.microtask(() {
      Provider.of<Transacoes>(context, listen: false).getControle();
    });
  }

  @override
  Widget build(BuildContext context) {
    final transacoes = context.watch<Transacoes>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .all(15),
            child: Column(
              spacing: 25,
              children: [
                Column(
                  children: [
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Olá, Alisson!',
                          style: TextStyle(
                            color: AppColor.texto,
                            fontSize: 20,
                            fontWeight: .bold,
                          ),
                        ),

                        Row(
                          spacing: 10,
                          children: [
                            GestureDetector(
                              onTap: () {
                                transacoes.getControle();
                              },
                              child: Icon(
                                Icons.refresh,
                                size: 25,
                                color: AppColor.texto,
                              ),
                            ),

                            Container(
                              padding: .all(2),
                              decoration: BoxDecoration(
                                color: AppColor.laranja,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://admin.faculdademalta.edu.br/media/profile_images/71cca382-04c5-43f0-b026-df41a99214a0.jpg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: 10 * 100,
                      padding: .all(15),
                      decoration: BoxDecoration(
                        color: AppColor.branco,
                        borderRadius: .circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'Seu saldo é',
                            style: TextStyle(
                              color: AppColor.texto,
                              fontSize: 15,
                              fontWeight: .bold,
                            ),
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Text(
                                isVisible ? 'R\$ 124,56' : 'R\$ ****',
                                style: TextStyle(
                                  color: AppColor.texto,
                                  fontSize: 25,
                                  fontWeight: .bold,
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  abrirolho();
                                },
                                child: Icon(
                                  isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 25,
                                  color: AppColor.texto,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                  spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          showDragHandle: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => AdicionarTransacaoPage(),
                        );
                      },
                      child: Container(
                        padding: .symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColor.laranja,
                          borderRadius: .circular(10),
                        ),
                        child: Row(
                          spacing: 2,
                          children: [
                            Icon(
                              Icons.monetization_on,
                              color: AppColor.branco,
                              size: 25,
                            ),

                            Text(
                              'Adicionar',
                              style: TextStyle(
                                color: AppColor.branco,
                                fontSize: 14,
                                fontWeight: .bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          showDragHandle: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => AdicionarTransacaoPage(),
                        );
                      },
                      child: Container(
                        padding: .symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColor.laranja,
                          borderRadius: .circular(10),
                        ),
                        child: Row(
                          spacing: 2,
                          children: [
                            Icon(
                              Icons.waterfall_chart,
                              color: AppColor.branco,
                              size: 25,
                            ),

                            Text(
                              'Metas',
                              style: TextStyle(
                                color: AppColor.branco,
                                fontSize: 14,
                                fontWeight: .bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          showDragHandle: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => AdicionarTransacaoPage(),
                        );
                      },
                      child: Container(
                        padding: .symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColor.laranja,
                          borderRadius: .circular(10),
                        ),
                        child: Row(
                          spacing: 2,
                          children: [
                            Icon(
                              Icons.category,
                              color: AppColor.branco,
                              size: 25,
                            ),

                            Text(
                              'Categorias',
                              style: TextStyle(
                                color: AppColor.branco,
                                fontSize: 14,
                                fontWeight: .bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: 5,
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: .symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Recentes',
                            style: TextStyle(
                              color: AppColor.texto,
                              fontSize: 15,
                              fontWeight: .bold,
                            ),
                          ),

                          GestureDetector(
                            child: Text(
                              'Ver todos >',
                              style: TextStyle(
                                color: AppColor.texto,
                                fontSize: 15,
                                fontWeight: .bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 10 * 100,
                      decoration: BoxDecoration(
                        borderRadius: .circular(10),
                        color: AppColor.branco,
                      ),

                      child: transacoes.isLoading
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Container(
                                          width: 10 * 100,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: AppColor.gainsboro,
                                            borderRadius: .circular(10),
                                          ),
                                        ),
                                      ),

                                      Container(
                                        width: 40,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: AppColor.gainsboro,
                                          borderRadius: .circular(10),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                final item = transacoes.transacoes[index];

                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Column(
                                          crossAxisAlignment: .start,
                                          children: [
                                            Text(
                                              item.descricao.toString(),
                                              maxLines: 1,
                                              overflow: .ellipsis,
                                              style: TextStyle(
                                                color: AppColor.texto,
                                                fontWeight: .bold,
                                              ),
                                            ),

                                            Text(
                                              item.tipo.toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppColor.texto,
                                                fontWeight: .bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Column(
                                        crossAxisAlignment: .end,
                                        children: [
                                          Text(
                                            isVisible
                                                ? 'R\$ ${item.valor}'
                                                : 'R\$ ****',
                                            style: TextStyle(
                                              color: AppColor.texto,
                                              fontWeight: .bold,
                                            ),
                                          ),

                                          Text(
                                            item.criadoEm.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColor.texto,
                                              fontWeight: .bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
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
