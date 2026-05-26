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
      appBar: AppBar(title: Text('Transações')),
      bottomNavigationBar: NavigationBar(
      backgroundColor: AppColor.backgroundNavBar,
      
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(color: AppColor.textColorPrimary, fontWeight: .bold, fontSize: 12),
      ),
      height: 50,
      indicatorColor: AppColor.gradientGreenSecondary,
      onDestinationSelected: (index) {
        setState(() {
          _currentIndex = index;
          
        });
      },
      selectedIndex: _currentIndex,
      destinations: [
        NavigationDestination(icon: Icon(Icons.currency_exchange, color: _currentIndex == 0 ? AppColor.gradientGreen:AppColor.gainsboro,), label: 'Histórico'),
        NavigationDestination(icon: Icon(Icons.bar_chart, color: _currentIndex == 1 ? AppColor.gradientGreen:AppColor.gainsboro,), label: 'Metas'),
        NavigationDestination(icon: Icon(Icons.gps_not_fixed_outlined, color: _currentIndex == 2 ? AppColor.gradientGreen:AppColor.gainsboro,), label: 'Fixos'),
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
