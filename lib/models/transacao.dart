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
  String? total;

  bool isLoading = false;
  Transacoes({required this.transacoes, this.total});

  void addTransacao(Transacao transacao) async {
    await dio.post(
      'https://api.agdev.com.br/api/controle/',
      // 'http://172.22.176.1:8000/api/controle/',
      data: {
        'valor': double.parse(
          transacao.valor!.replaceAll('.', '').replaceAll(',', '.'),
        ),
        'descricao': transacao.descricao,
        'perfil': 1,
        'tipo': 'Saída',
        'qtd': 1,
      },
    );

    getAllFunctions();
  }

  Future<void> getControle() async {
    isLoading = true;
    notifyListeners();
    final response = await dio.get('http://api.agdev.com.br/api/controle/');
    // final response = await dio.get('http://172.22.176.1:8000/api/controle/');
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


  Future<void> getTotal() async {
    final response = await dio.get('http://api.agdev.com.br/api/total/?perfil=1');
    // final response = await dio.get('http://172.22.176.1:8000/api/total/?perfil=1');

    total = response.data['valor_total'];
    notifyListeners();
}

void getAllFunctions() async {
  await Future.wait([
    getControle(),
    getTotal(),
  ]);
}

}