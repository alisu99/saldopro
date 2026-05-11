import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';

class AdicionarTransacaoPage extends StatefulWidget {
  const AdicionarTransacaoPage({super.key});

  @override
  State<AdicionarTransacaoPage> createState() => _AdicionarTransacaoPageState();
}

class _AdicionarTransacaoPageState extends State<AdicionarTransacaoPage> {
  final valorController = TextEditingController();
  final descricaoController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final transacoes = context.read<Transacoes>();

    @override
    void dispose() {
      valorController.dispose();
      descricaoController.dispose();
      super.dispose();
    }

    return SafeArea(
      child: Container(
        padding: .all(15),
        height: MediaQuery.of(context).size.height * 0.70,
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              spacing: 20,

              children: [
                TextField(
                  controller: valorController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Valor',
                      style: TextStyle(
                        color: AppColor.texto,
                        fontWeight: .bold,
                        fontSize: 15,
                      ),
                    ),

                    contentPadding: .all(15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(7),
                      borderSide: BorderSide(
                        color: AppColor.gainsboro,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: .circular(7),
                      borderSide: BorderSide(
                        color: AppColor.gainsboro,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                TextField(
                  controller: descricaoController,
                  decoration: InputDecoration(
                    label: Text(
                      'Descrição',
                      style: TextStyle(
                        color: AppColor.texto,
                        fontWeight: .bold,
                        fontSize: 15,
                      ),
                    ),

                    contentPadding: .all(15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(7),
                      borderSide: BorderSide(
                        color: AppColor.gainsboro,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: .circular(7),
                      borderSide: BorderSide(
                        color: AppColor.gainsboro,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                transacoes.addTransacao(Transacao(descricao: descricaoController.text, valor: valorController.text));
                Navigator.pop(context);
              },
              child: Container(
                padding: .all(15),
                width: 10 * 100,
                decoration: BoxDecoration(
                  color: AppColor.laranja,
                  borderRadius: .circular(10),
                ),
                child: Text(
                  'Adicionar',
                  style: TextStyle(
                    color: AppColor.branco,
                    fontSize: 15,
                    fontWeight: .bold,
                  ),
                  textAlign: .center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
