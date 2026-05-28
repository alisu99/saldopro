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
  double totalSaida = 0;
  double totalEntrada = 0;
  double saldo = 0;

  bool isLoading = false;
  Transacoes({required this.transacoes});

  void addTransacao(Transacao transacao) async {
    final response = await dio.post(
      'https://api.agdev.com.br/api/controle/',
      data: {
        'valor': double.parse(
          transacao.valor!.replaceAll('.', '').replaceAll(',', '.'),
        ),
        'descricao': transacao.descricao,
        'perfil': 1,
        'tipo': transacao.tipo,
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
    atualizarProvider();
    notifyListeners();
  }

  void deletarTransacao(int transacaoId) async {
    // await dio.delete('http://172.21.16.1:8000/api/controle/$transacaoId/');
    await dio.delete('https://api.agdev.com.br/api/controle/$transacaoId/');
    transacoes.removeWhere((t) => t.id == transacaoId);
    atualizarProvider();
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
    atualizarProvider();
    notifyListeners();
  }

  Future<void> getTotal() async {
    final response = await dio.get(
      'http://api.agdev.com.br/api/total/?perfil=1',
    );
    // final response = await dio.get('http://172.22.176.1:8000/api/total/?perfil=1');

    total = response.data['valor_total'];
    atualizarProvider();
    notifyListeners();
  }

  void getAllFunctions() async {
    await Future.wait([getControle(), getTotal()]);
    atualizarSaldo();
    
    notifyListeners();
    
  }

  void atualizarTotalSaida() {
    totalSaida = 0;
    for (var t in transacoes) {
      if (t.tipo == 'Saída') {
        totalSaida =
            totalSaida +
            double.parse(t.valor!.replaceAll('.', '').replaceAll(',', '.'));
      }
    }
  }

  void atualizarTotalEntrada() {
    totalEntrada = 0;
    for (var t in transacoes) {
      if (t.tipo == 'Entrada') {
        totalEntrada =
            totalEntrada +
            double.parse(t.valor!.replaceAll('.', '').replaceAll(',', '.'));
      }
    }
  }

  void atualizarSaldo() {
    saldo = totalEntrada - totalSaida;
  }

  void atualizarProvider() {
    atualizarSaldo();
    atualizarTotalEntrada();
    atualizarTotalSaida();
  }
}
