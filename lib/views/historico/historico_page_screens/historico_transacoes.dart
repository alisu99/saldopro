import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/utils/historico_page_utils.dart';

class HistoricoTransacoesPage extends StatefulWidget {
  const HistoricoTransacoesPage({super.key});

  @override
  State<HistoricoTransacoesPage> createState() =>
      _HistoricoTransacoesPageState();
}

class _HistoricoTransacoesPageState extends State<HistoricoTransacoesPage> {
  @override
  Widget build(BuildContext context) {
    final transacoes = context.watch<Transacoes>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .only(left: 10, right: 10, top: 10),
          // coluna principal
          child: Column(
            spacing: 30,
            children: [
              // GridView.count(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   crossAxisCount: 2,
              //   crossAxisSpacing: 8,
              //   mainAxisSpacing: 8,
              //   mainAxisExtent: 90,
              //   children: items,
              // ),
              SizedBox(
                height: 100,
                child: PageView(
                  children: [
                    ItemDash(
                      'Entradas',
                      Icon(Icons.money),
                      transacoes.totalEntrada.toString(),
                      'Maio',
                      context,
                    ),
                    ItemDash(
                      'Entradas',
                      Icon(Icons.money),
                      transacoes.totalEntrada.toString(),
                      'Maio',
                      context,
                    ),
                    ItemDash(
                      'Entradas',
                      Icon(Icons.money),
                      transacoes.totalEntrada.toString(),
                      'Maio',
                      context,
                    ),
                  ],
                ),
              ),

              Expanded(
                child: RefreshIndicator(
                  color: AppColor.gradientGreen,
                  backgroundColor: AppColor.branco,
                  onRefresh: () => Future.delayed(Duration.zero, () {
                    transacoes.getAllFunctions();
                  }),
                  child: transacoes.isLoading
                      ? ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 4),
                          itemCount: transacoes.transacoes.length,
                          itemBuilder: (context, index) {
                            return loadHistorico();
                          },
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 4),
                          itemCount: transacoes.transacoes.length,

                          itemBuilder: (context, index) {
                            final item = transacoes.transacoes[index];

                            return historico(
                              item.id!,
                              item.descricao.toString(),
                              item.tipo.toString(),
                              item.valor.toString(),
                              item.criadoEm.toString(),
                              context,
                              transacoes,
                            );
                          },
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
