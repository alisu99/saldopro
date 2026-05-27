import 'package:flutter/material.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';

class DetalhesPage extends StatelessWidget {
  final Transacao transacao;
  const DetalhesPage({super.key, required this.transacao});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes')),
      body: SafeArea(
        child: Padding(
          padding: .all(10),
          child: Column(
            children: [
              Text(transacao.descricao.toString(), style: TextStyle(color: AppColor.textColorPrimary),)
            ],
          ),
        ),
      ),
    );
  }
}