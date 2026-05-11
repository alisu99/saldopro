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
  Widget build(BuildContext context) {
    final transacoes = context.watch<Transacoes>();
    final recentes = transacoes.transacoes.reversed.take(3).toList();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .all(20),
            child: Column(
              spacing: 35,
              children: [
                Column(
                  children: [
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          spacing: 5,
                          children: [
                            Container(
                              padding: .all(1),
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

                            Text(
                              'Alisson',
                              style: TextStyle(
                                color: AppColor.texto,
                                fontSize: 16,
                                fontWeight: .bold,
                              ),
                            ),
                          ],
                        ),

                        InkWell(
                          onTap: () {
                            abrirolho();
                          },
                          child: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            size: 35,
                            color: AppColor.texto,
                          ),
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
                            'Total',
                            style: TextStyle(
                              color: AppColor.texto,
                              fontSize: 15,
                              fontWeight: .bold,
                            ),
                          ),
                          Text(
                            isVisible ? 'R\$ 124,56' : 'R\$ ****',
                            style: TextStyle(
                              color: AppColor.texto,
                              fontSize: 25,
                              fontWeight: .bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          // InkWell(
                          //   child: Container(
                          //     padding: .symmetric(horizontal: 10, vertical: 5),
                          //     decoration: BoxDecoration(
                          //       color: AppColor.laranja,
                          //       borderRadius: .circular(10),
                          //     ),
                          //     child: Row(
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         Icon(Icons.refresh, color: AppColor.branco),
                          //         Text(
                          //           'Atualizar',
                          //           style: TextStyle(
                          //             color: AppColor.branco,
                          //             fontWeight: .bold,
                          //             fontSize: 14,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
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
                      child: SizedBox(
                        width: 90,
                        child: Column(
                          spacing: 5,
                          children: [
                            Container(
                              padding: .all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.laranja,
                              ),
                              child: Icon(
                                Icons.monetization_on,
                                color: AppColor.branco,
                                size: 25,
                              ),
                            ),
                            Text(
                              'Adicionar',
                              style: TextStyle(
                                color: AppColor.texto,
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
                      child: SizedBox(
                        width: 90,
                        child: Column(
                          spacing: 5,
                          children: [
                            Container(
                              padding: .all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.laranja,
                              ),
                              child: Icon(
                                Icons.stacked_bar_chart_outlined,
                                color: AppColor.branco,
                                size: 25,
                              ),
                            ),
                            Text(
                              'Metas',
                              style: TextStyle(
                                color: AppColor.texto,
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
                      child: SizedBox(
                        width: 90,
                        child: Column(
                          spacing: 5,
                          children: [
                            Container(
                              padding: .all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.laranja,
                              ),
                              child: Icon(
                                Icons.category,
                                color: AppColor.branco,
                                size: 25,
                              ),
                            ),
                            Text(
                              'Categorias',
                              style: TextStyle(
                                color: AppColor.texto,
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
                  crossAxisAlignment: .start,
                  children: [
                    Row(
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
                            'Ver todos',
                            style: TextStyle(
                              color: AppColor.texto,
                              fontSize: 15,
                              fontWeight: .bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 10 * 100,
                      padding: .all(5),
                      decoration: BoxDecoration(
                        borderRadius: .circular(10),
                        color: AppColor.branco,
                      ),

                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: recentes.length,
                        itemBuilder: (context, index) {
                          final item = recentes[index];

                          return ListTile(
                            title: Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    item.descricao.toString(),
                                    maxLines: 1,
                                    overflow: .ellipsis,
                                    style: TextStyle(
                                      color: AppColor.texto,
                                      fontWeight: .bold,
                                    ),
                                  ),
                                ),

                                Text(
                                  isVisible ? 'R\$ ${item.valor}' : 'R\$ ****',
                                  style: TextStyle(
                                    color: AppColor.texto,
                                    fontWeight: .bold,
                                  ),
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
