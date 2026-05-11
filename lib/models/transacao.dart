import 'package:flutter/material.dart';

class Transacao {
  String? valor;
  String? descricao;

  Transacao({this.valor, this.descricao});
}

class Transacoes extends ChangeNotifier{
  List<Transacao> transacoes;

  Transacoes({
    required this.transacoes
  });

  void addTransacao(Transacao transacao) {
    transacoes.add(transacao);
    notifyListeners();
  }
}