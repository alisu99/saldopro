import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:saldopro/services/client_dio.dart';

class Transacao {
  int? id;
  String? valor;
  String? descricao;
  String? criadoEm;
  String? tipo;
  String? categoria;

  Transacao({
    this.valor,
    this.descricao,
    this.criadoEm,
    this.tipo,
    this.id,
    this.categoria,
  });
}

class Categoria {
  String? nome;
  String? porcentagemString;
  int? quantidade;
  double? porcentagem;

  Categoria({
    this.nome,
    this.porcentagem,
    this.quantidade,
    this.porcentagemString,
  });
}

class Categorias extends ChangeNotifier {
  List<Categoria> categorias;
  bool isLoading = false;
  Categorias({required this.categorias});

  Future<void> getCategorias() async {
    isLoading = true;
    notifyListeners();
    final response = await dio.get('$route/api/categorias/');
    final Map<String, dynamic> data = response.data;
    categorias = data.entries
        .map(
          (entry) => Categoria(
            nome: entry.key,
            quantidade: entry.value['quantidade'],
            porcentagemString: entry.value['porcentagem_string'],
            porcentagem: (entry.value['porcentagem'] as num).toDouble(),
          ),
        )
        .toList();
    isLoading = false;
    notifyListeners();
  }

  void getAllFunctions() async {
    await getCategorias();
    notifyListeners();
  }
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
      '$route/api/controle/',
      data: {
        'valor': double.parse(
          transacao.valor!.replaceAll('.', '').replaceAll(',', '.'),
        ),
        'descricao': transacao.descricao,
        'tipo': transacao.tipo,
        'categoria': transacao.categoria,
      },
    );

    final novaTransacao = Transacao(
      id: response.data['id'],
      valor: response.data['valor_formatado'],
      descricao: response.data['descricao'],
      criadoEm: response.data['criado_em_formatado'],
      tipo: response.data['tipo'],
      categoria: response.data['categoria'],
    );

    transacoes.insert(0, novaTransacao);
    atualizarProvider();
    notifyListeners();
  }

  void deletarTransacao(int transacaoId) async {
    await dio.delete('$route/api/controle/$transacaoId/');
    transacoes.removeWhere((t) => t.id == transacaoId);
    atualizarProvider();
    notifyListeners();
  }

  Future<void> getControle() async {
    isLoading = true;
    notifyListeners();
    final response = await dio.get('$route/api/controle/');
    final List<dynamic> lista = response.data;
    transacoes = lista
        .map(
          (item) => Transacao(
            id: item['id'],
            valor: item['valor_formatado'],
            descricao: item['descricao'],
            criadoEm: item['criado_em_formatado'],
            categoria: item['categoria'],
            tipo: item['tipo'],
          ),
        )
        .toList();

    isLoading = false;
    atualizarProvider();
    notifyListeners();
  }

  Future<void> getTotal() async {
    final response = await dio.get('$route/api/total/');
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
