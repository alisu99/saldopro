import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Transacao {
  int? id;
  String? valor;
  String? descricao;
  String? criadoEm;
  String? tipo;

  Transacao({this.valor, this.descricao, this.criadoEm, this.tipo, this.id});
}

class Transacoes extends ChangeNotifier {
  List<Transacao> transacoes;
  String? total;

  bool isLoading = false;
  Transacoes({required this.transacoes, this.total});

  void addTransacao(Transacao transacao) async {
    final response = await dio.post(
      'https://api.agdev.com.br/api/controle/',
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

    final novaTransacao = Transacao(
      id: response.data['id'],
      valor: response.data['valor_formatado'],
      descricao: response.data['descricao'],
      criadoEm: response.data['criado_em_formatado'],
      tipo: response.data['tipo'],
    );

    transacoes.insert(0, novaTransacao);
    notifyListeners();
  }

  void deletarTransacao(int transacaoId) async {
    // await dio.delete('http://172.21.16.1:8000/api/controle/$transacaoId/');
    await dio.delete('https://api.agdev.com.br/api/controle/$transacaoId/');
    transacoes.removeWhere((t) => t.id == transacaoId);
    notifyListeners();
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
            id: item['id'],
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
    final response = await dio.get(
      'http://api.agdev.com.br/api/total/?perfil=1',
    );
    // final response = await dio.get('http://172.22.176.1:8000/api/total/?perfil=1');

    total = response.data['valor_total'];
    notifyListeners();
  }

  void getAllFunctions() async {
    await Future.wait([getControle(), getTotal()]);
  }
}
