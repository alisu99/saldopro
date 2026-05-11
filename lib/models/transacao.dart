import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Transacao {
  String? valor;
  String? descricao;
  String? criadoEm;
  String? tipo;


  Transacao({this.valor, this.descricao, this.criadoEm, this.tipo});
}

class Transacoes extends ChangeNotifier {
  List<Transacao> transacoes;
  bool isLoading = false;
  Transacoes({required this.transacoes});

  void addTransacao(Transacao transacao) async {
    await dio.post(
      'https://api.agdev.com.br/api/controle/',
      data: {
        'valor': transacao.valor,
        'descricao': transacao.descricao,
        'perfil': 1,
        'tipo': 'Saída',
        'qtd': 1,
      },
    );
    getControle();
  }

  void getControle() async {
    isLoading = true;
    notifyListeners();
    final response = await dio.get('https://api.agdev.com.br/api/controle/');
    final List<dynamic> lista = response.data;

    transacoes = lista
        .map(
          (item) => Transacao(
            valor: item['valor_formatado'],
            descricao: item['descricao'],
            criadoEm: item['criado_em_formatado'],
            tipo: item['tipo'],
          ),
        )
        .toList();

    isLoading = false;
    notifyListeners();
  }

}
