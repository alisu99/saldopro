import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Transacao {
  String? valor;
  String? descricao;

  Transacao({this.valor, this.descricao});
}

class Transacoes extends ChangeNotifier {
  List<Transacao> transacoes;
  double valorTotal;
  bool isLoading = false;
  Transacoes({required this.transacoes, required this.valorTotal});

  void addTransacao(Transacao transacao) async {
    final response = await dio.post(
      'https://api.agdev.com.br/api/controle/',
      data: {
        'valor': transacao.valor,
        'descricao': transacao.descricao,
        'perfil': 1,
        'tipo': 'Saída',
        'qtd': 1,
      },
    );

    atualizarValorTotal(response.data['valor']);

    getControle();
  }

  void atualizarValorTotal(double valor) {
    valorTotal += valor;
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
          ),
        )
        .toList();

    isLoading = false;
    notifyListeners();
  }

}
