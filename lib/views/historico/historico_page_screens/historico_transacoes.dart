import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/utils/historico_page_utils.dart';
import 'package:saldopro/views/utils/home_page_utils.dart' hide ItemDash;

class HistoricoTransacoesPage extends StatefulWidget {
  const HistoricoTransacoesPage({super.key});

  @override
  State<HistoricoTransacoesPage> createState() =>
      _HistoricoTransacoesPageState();
}

class _HistoricoTransacoesPageState extends State<HistoricoTransacoesPage> {
  final TextEditingController _searchController = TextEditingController();

  String search = '';

  @override
  Widget build(BuildContext context) {
    final transacoes = context.watch<Transacoes>();
    
    final transacoesFiltradas = transacoes.transacoes.where((item) {
      final descricao = item.descricao.toString().toLowerCase();

      final tipo = item.tipo.toString().toLowerCase();

      final textoPesquisa = search.toLowerCase();

      return descricao.contains(textoPesquisa) || tipo.contains(textoPesquisa);
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .only(left: 10, right: 10, top: 10, bottom: 2),

          child: Column(
            spacing: 10,
            children: [
              ItemDash(
                'Saldo',
                Icon(Icons.wallet_outlined, color: AppColor.textColorPrimary),
                transacoes.saldo,
              ),

              Column(
                    spacing: 5,
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 70,
                        children: getAcoes(context).take(1).toList(),
                      ),
                    ],
                  ),

              TextField(
                controller: _searchController,

                style: TextStyle(color: AppColor.gainsboro),

                cursorColor: AppColor.gainsboro,

                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },

                decoration: InputDecoration(
                  hintText: 'Pesquisar...',

                  prefixIcon: Icon(Icons.search),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.texto),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.texto),
                  ),
                ),
              ),

              

              Expanded(
                child: RefreshIndicator(
                  color: AppColor.gradientGreen,
                  backgroundColor: AppColor.backgroundNavBar,
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
                          itemCount: transacoesFiltradas.length,

                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 4),

                          itemBuilder: (context, index) {
                            final item = transacoesFiltradas[index];

                            return historico(
                              item.id!,
                              item.descricao.toString(),
                              item.tipo.toString(),
                              item.valor.toString(),
                              item.criadoEm.toString(),
                              context,
                              transacoes,
                              item
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
