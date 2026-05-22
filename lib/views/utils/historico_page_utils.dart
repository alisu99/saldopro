import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/home/adicionar_transacao_page.dart';

Widget ItemDash(String nome, Icon icon, String money, String mes, BuildContext context) {
  return Column(
    children: [
      Container(
        padding: .all(10),
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: AppColor.backgroundCard,
          borderRadius: .circular(10),
        ),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              spacing: 4,
              children: [
                Container(
                  padding: .all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.backgroundDark,
                  ),
                  child: icon
                ),
                Expanded(
                  child: Text(
                    nome,
                    style: TextStyle(color: AppColor.branco, fontSize: 16),
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
                    color: AppColor.branco,
                    fontSize: 15,
                    fontWeight: .bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget historico(
  int id,
  String descricao,
  String tipo,
  String valor,
  String criadoEm,
  BuildContext context,
  Transacoes transacoes,
) {
  bool isSaida = false;
  if (tipo.toString() == 'Saída') {
    isSaida = true;
  }
  return Dismissible(
    key: UniqueKey(),

    confirmDismiss: (direction) async {
      showModalBottomSheet(
        context: context,
        clipBehavior: .antiAlias,
        isScrollControlled: true,
        backgroundColor: AppColor.backgroundCard,
        builder: (context) {
          return SafeArea(
            child: Container(
              padding: .only(bottom: 5, right: 5, left: 5),
              width: .infinity,
              child: Column(
                spacing: 5,
                mainAxisSize: .min,
                children: [
                  SizedBox(height: 1),
            
                  Padding(
                    padding: .all(10),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Deseja realmente excluir?',
                          style: TextStyle(
                            color: AppColor.branco,
                            fontSize: 16,
                            fontWeight: .bold,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: .all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.backgroundDark,
                            ),
                            child: Icon(
                              Icons.close,
                              color: AppColor.gainsboro,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  Container(
                    padding: .all(10),
                    decoration: BoxDecoration(
                      color: AppColor.backgroundDark,
                      borderRadius: .circular(10),
                    ),
                    child: Column(
                      spacing: 10,
                      children: [
                        Row(
                          spacing: 10,
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                descricao,
                                style: TextStyle(
                                  color: AppColor.branco,
                                  fontSize: 14,
                                  fontWeight: .bold,
                                ),
                              ),
                            ),
            
                            Text(
                              'R\$ $valor',
                              style: TextStyle(
                                color: AppColor.branco,
                                fontSize: 14,
                                fontWeight: .bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              tipo,
                              style: TextStyle(
                                color: AppColor.branco,
                                fontSize: 14,
                                fontWeight: .bold,
                              ),
                            ),
            
                            Text(
                              criadoEm,
                              style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize: 14,
                                fontWeight: .bold,
                              ),
                            ),
                          ],
                        ),
            
                        GestureDetector(
                          onTap: () {
                            transacoes.deletarTransacao(id.toInt());
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: .symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColor.gradientRed,
                              borderRadius: .circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  'Excluir',
                                  style: TextStyle(
                                    color: AppColor.branco,
                                    fontSize: 16,
                                    fontWeight: .bold,
                                  ),
                                ),
                                Icon(
                                  Icons.delete,
                                  size: 25,
                                  color: AppColor.branco,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

      return null;
    },

    background: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.delete, color: Colors.white),
    ),

    secondaryBackground: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.delete, color: Colors.white),
    ),

    child: Container(
      padding: .symmetric(horizontal: 10, vertical: 10),
      width: .infinity,
      decoration: BoxDecoration(
        color: AppColor.backgroundCard,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(
                Icons.currency_exchange,
                size: 20,
                color: isSaida ? AppColor.gradientRed : AppColor.gradientGreen,
              ),

              

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      descricao,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    tipo,
                    style: TextStyle(
                      color: AppColor.texto,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$ $valor',
                style: TextStyle(
                  color: AppColor.textColorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                criadoEm,
                style: TextStyle(
                  color: AppColor.texto,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget itemAcoes(String nome, Icon icon, rota) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: .all(2.5),
      decoration: BoxDecoration(
        borderRadius: .circular(10),
        gradient: LinearGradient(
          colors: [AppColor.gradientRed, AppColor.gradientGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        padding: .symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          color: AppColor.backgroundCard,
          borderRadius: .circular(8),
        ),
        child: Column(
          mainAxisAlignment: .center,
          spacing: 5,
          children: [
            icon,
            Text(
              nome,
              style: TextStyle(
                color: AppColor.textColorPrimary,
                fontSize: 14,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget loadHistorico() {
  return Container(
    padding: .symmetric(vertical: 20, horizontal: 15),
    width: 10 * 100,
    decoration: BoxDecoration(
      color: AppColor.backgroundCard,
      borderRadius: .circular(10),
    ),
    child: LinearProgressIndicator(
      minHeight: 20,
      backgroundColor: AppColor.backgroundProgress,
      color: AppColor.backgroundDark,
      borderRadius: .circular(10),
    ),
  );
}

List<Widget> acoes = [
  itemAcoes(
    'Novo',
    Icon(Icons.add, color: AppColor.textColorPrimary, size: 25),
    AdicionarTransacaoPage(),
  ),
];
