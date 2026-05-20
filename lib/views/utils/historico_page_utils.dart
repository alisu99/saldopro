import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/home/adicionar_transacao_page.dart';

Widget ItemDash(String nome, Icon icon, String money) {
  return Container(
    padding: .all(10),

    decoration: BoxDecoration(
      color: AppColor.backgroundCard,
      borderRadius: .circular(10),
    ),
    child: Column(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          spacing: 4,
          children: [
            Container(
              padding: .all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.backgroundDark,
              ),
              child: icon,
            ),
            Expanded(
              child: Text(
                nome,
                style: TextStyle(color: AppColor.branco, fontSize: 16),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: .end,
          children: [
            Text(
              'R\$ $money',
              style: TextStyle(
                color: AppColor.branco,
                fontSize: 15,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget historico(
  int id,
  String descricao,
  String tipo,
  String valor,
  String criadoEm,
  BuildContext context,
  Transacoes transacoes,
) {
  return Dismissible(
    key: UniqueKey(),

    confirmDismiss: (direction) async {
      showDialog(

        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColor.backgroundProgress,
            title: Text(
              'Confirmar exclusão',
              style: TextStyle(fontSize: 18, fontWeight: .bold, color: AppColor.branco),
            ),

            actions: [
              TextButton(
                style: TextButton.styleFrom(overlayColor: Colors.transparent),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 16, fontWeight: .bold, color: AppColor.branco),
                ),
              ),

              TextButton(
                style: TextButton.styleFrom(overlayColor: Colors.transparent),
                onPressed: () {
                  transacoes.deletarTransacao(id.toInt());
                  Navigator.pop(context);
                },
                child: Text(
                  'Sim, quero excluir',
                  style: TextStyle(fontSize: 16, fontWeight: .bold, color: AppColor.branco),
                ),
              ),
            ],
          );
        },
      );

      return null;
    },

    background: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColor.gradientBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.edit, color: Colors.white),
    ),

    secondaryBackground: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: AppColor.gradientRed,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.delete, color: Colors.white),
    ),

    child: Container(
      padding: .symmetric(horizontal: 15, vertical: 10),
      margin: .symmetric(vertical: 2),
      width: .infinity,
      decoration: BoxDecoration(
        color: AppColor.backgroundCard,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.monetization_on_outlined,
                size: 30,
                color: AppColor.laranja,
              ),

              SizedBox(width: 5),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      descricao,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    tipo,
                    style: TextStyle(
                      color: AppColor.textColorPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$ $valor',
                style: TextStyle(
                  color: AppColor.textColorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                criadoEm,
                style: TextStyle(
                  color: AppColor.textColorPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget itemAcoes(String nome, Icon icon, rota) {
  return GestureDetector(
    onTap: () {
      
    },
    child: Container(
      padding: .all(2.5),
      decoration: BoxDecoration(
        borderRadius: .circular(10),
        gradient: LinearGradient(
          colors: [AppColor.gradientRed, AppColor.gradientGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        padding: .symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          color: AppColor.backgroundCard,
          borderRadius: .circular(8),
        ),
        child: Column(
          mainAxisAlignment: .center,
          spacing: 5,
          children: [
            icon,
            Text(
              nome,
              style: TextStyle(
                color: AppColor.textColorPrimary,
                fontSize: 14,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget loadHistorico() {
  return Container(
    padding: .symmetric(vertical: 20, horizontal: 15),
    width: 10 * 100,
    decoration: BoxDecoration(
      color: AppColor.backgroundCard,
      borderRadius: .circular(10),
    ),
    child: LinearProgressIndicator(
      minHeight: 10,
      backgroundColor: AppColor.backgroundProgress,
      color: AppColor.backgroundDark,
      borderRadius: .circular(10),
    ),
  );
}

final List<Widget> items = [
  ItemDash(
    'Entradas nesse mês',
    Icon(
      Icons.attach_money_rounded,
      color: AppColor.textColorPrimary,
      size: 18,
    ),
    '145,80',
  ),
  ItemDash(
    'Saídas nesse mês',
    Icon(
      Icons.attach_money_rounded,
      color: AppColor.textColorPrimary,
      size: 18,
    ),
    '200,00',
  ),
  ItemDash(
    'Saldo',
    Icon(Icons.wallet, color: AppColor.textColorPrimary, size: 18),
    '475,80',
  ),
  ItemDash(
    'Fixas',
    Icon(Icons.gps_not_fixed, color: AppColor.textColorPrimary, size: 18),
    '670,80',
  ),
];

List<Widget> acoes = [
  itemAcoes('Novo', Icon(Icons.add, color: AppColor.textColorPrimary, size: 25), AdicionarTransacaoPage())
  
];