import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';

class DetalhesPage extends StatelessWidget {
  final Transacao transacao;
  const DetalhesPage({super.key, required this.transacao});

  @override
  Widget build(BuildContext context) {
    bool isSaida = false;
    if (transacao.tipo.toString() == 'Saída') {
      isSaida = true;
    }
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes')),
      backgroundColor: AppColor.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding: .all(10),
          child: Column(
            spacing: 10,
            children: [
              Column(
                children: [
                  Container(
                    padding: .all(10),
                    decoration: BoxDecoration(
                      color: AppColor.backgroundCard,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.currency_exchange,
                      size: 30,
                      color: isSaida
                          ? AppColor.gradientRed
                          : AppColor.gradientGreen,
                    ),
                  ),

                  Text(
                    'R\$ ${transacao.valor}',
                    style: TextStyle(
                      color: AppColor.textColorPrimary,
                      fontSize: 30,
                      fontWeight: .bold,
                    ),
                  ),
                ],
              ),

              Container(
                width: .infinity,
                padding: .all(15),
                decoration: BoxDecoration(
                  color: AppColor.backgroundCard,
                  borderRadius: .circular(10),
                ),
                child: Column(
                  spacing: 15,
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      spacing: 10,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Descrição',
                          style: TextStyle(
                            color: AppColor.texto,
                            fontSize: 14,
                            fontWeight: .bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            textAlign: .end,
                            transacao.descricao.toString(),
                            style: TextStyle(
                              color: AppColor.textColorPrimary,
                              fontSize: 16,
                              fontWeight: .bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Tipo',
                          style: TextStyle(
                            color: AppColor.texto,
                            fontSize: 14,
                            fontWeight: .bold,
                          ),
                        ),
                        Text(
                          transacao.tipo.toString(),
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 16,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Categoria',
                          style: TextStyle(
                            color: AppColor.texto,
                            fontSize: 14,
                            fontWeight: .bold,
                          ),
                        ),
                        Text(
                          transacao.categoria.toString(),
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 16,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Data',
                          style: TextStyle(
                            color: AppColor.texto,
                            fontSize: 14,
                            fontWeight: .bold,
                          ),
                        ),
                        Text(
                          transacao.criadoEm.toString(),
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 16,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),

                    Divider(color: AppColor.backgroundProgress),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: .infinity,
                        padding: .all(10),
                        decoration: BoxDecoration(
                          borderRadius: .circular(10),
                          color: Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text('Excluir', style: TextStyle(color: AppColor.branco, fontWeight: .bold, fontSize: 16),),
                            Icon(
                              Icons.delete,
                              size: 20,
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
      ),
    );
  }
}
