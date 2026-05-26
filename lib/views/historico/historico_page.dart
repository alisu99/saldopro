import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/historico/historico_page_screens/fixos_page.dart';
import 'package:saldopro/views/historico/historico_page_screens/historico_transacoes.dart';
import 'package:saldopro/views/historico/historico_page_screens/metas_page.dart';
import 'package:saldopro/views/utils/historico_page_utils.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => HistoricoPageState();
}

class HistoricoPageState extends State<HistoricoPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico')),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.backgroundDark,
        selectedItemColor: AppColor.textColorPrimary,
        unselectedItemColor: AppColor.backgroundProgress,
        
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedFontSize: 12,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _currentIndex,
        useLegacyColorScheme: false,


        items: [
          BottomNavigationBarItem(icon: Icon(Icons.currency_exchange), label: 'Histórico'),
          BottomNavigationBarItem(icon: Icon(Icons.waterfall_chart_sharp), label: 'Metas'),
          BottomNavigationBarItem(icon: Icon(Icons.pin), label: 'Fixos'),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HistoricoTransacoesPage(),
          MetasPage(),
          FixosPage(),
        ],
      )
    );
  }
}
