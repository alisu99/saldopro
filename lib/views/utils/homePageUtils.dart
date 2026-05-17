import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/home/adicionarTransacaoPage.dart';

Widget ItemDash(String nome, Icon icon, String money) {
  return Container(
    padding: .all(10),
    width: 150,
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

            Text(
              nome,
              style: TextStyle(
                color: AppColor.textColorPrimary,
                fontSize: 14,
                // fontWeight: .bold,
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
                color: AppColor.textColorPrimary,
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

Widget itemAcoes(String nome, Icon icon, rota, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => rota,));
    },
    child: Container(
      padding: .all(1.5),
      decoration: BoxDecoration(
        borderRadius: .circular(10),
        color: AppColor.backgroundCard,
        gradient: LinearGradient(
          colors: [AppColor.gradientRed, AppColor.gradientGreen],
        ),
      ),
      child: Container(
        // padding: .all(10),
        decoration: BoxDecoration(
          color: AppColor.backgroundCard,
          borderRadius: .circular(10),
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

Widget recentes(String descricao, String tipo, String valor, String criadoEm) {
  return Container(
    padding: .symmetric(vertical: 10, horizontal: 15),
    width: 10 * 100,
    decoration: BoxDecoration(
      color: AppColor.backgroundCard,
      borderRadius: .circular(10),
    ),
    child: Row(
      mainAxisAlignment: .spaceBetween,
      mainAxisSize: .max,
      children: [
        Row(
          spacing: 5,
          children: [
            Icon(
              Icons.monetization_on_outlined,
              size: 30,
              color: AppColor.laranja,
            ),

            Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    descricao,
                    style: TextStyle(
                      color: AppColor.textColorPrimary,
                      fontSize: 16,
                      fontWeight: .bold,
                    ),
                    overflow: .ellipsis,
                    maxLines: 1,
                  ),
                ),

                Text(
                  tipo,
                  style: TextStyle(
                    color: AppColor.textColorPrimary,
                    fontSize: 13,
                    fontWeight: .bold,
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: .end,
          children: [
            Text(
              'R\$ $valor',
              style: TextStyle(
                color: AppColor.textColorPrimary,
                fontSize: 16,
                fontWeight: .bold,
              ),
            ),
            Text(
              criadoEm,
              style: TextStyle(
                color: AppColor.textColorPrimary,
                fontSize: 13,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget loadRecentes() {
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

Widget loadTotal() {
  return Container(
    padding: .symmetric(vertical: 10),
    width: 100,
    decoration: BoxDecoration(
      color: AppColor.backgroundCard,
      borderRadius: .circular(10),
    ),
    child: LinearProgressIndicator(
      minHeight: 16,
      
      backgroundColor: AppColor.backgroundProgress,
      color: AppColor.backgroundDark,
      borderRadius: .circular(10),
    ),
  );
}

Widget loadSaidas() {
  return Container(
    padding: .symmetric(vertical: 10),
    width: 100,
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


Widget categoria(Icon icon, String nome, double porcentagem, Color cor) {
  return Column(
    spacing: 2,
    children: [
      Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Row(
            spacing: 5,
            children: [
              icon,
              Text(
                nome,
                style: TextStyle(
                  color: AppColor.textColorPrimary,
                  fontSize: 15,
                  fontWeight: .bold,
                ),
              ),
            ],
          ),
          Text(
            porcentagem.toString(),
            style: TextStyle(
              color: AppColor.textColorPrimary,
              fontSize: 15,
              fontWeight: .bold,
            ),
          ),
        ],
      ),

      LinearProgressIndicator(
        backgroundColor: AppColor.backgroundProgress,
        borderRadius: .circular(10),
        minHeight: 5,
        color: cor,
        value: 1 * porcentagem,
      ),
    ],
  );
}

class RealInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.isEmpty) return newValue.copyWith(text: '');

    final centavos = int.parse(digits);
    final reais = centavos / 100;

    final formatter = NumberFormat('#,##0.00', 'pt_BR');
    final texto = formatter.format(reais);

    return newValue.copyWith(
      text: texto,
      selection: TextSelection.collapsed(offset: texto.length),
    );
  }
}

final List items = [
  ItemDash(
    'Entradas',
    Icon(
      Icons.attach_money_rounded,
      color: AppColor.textColorPrimary,
      size: 18,
    ),
    '145,80',
  ),
  ItemDash(
    'Saídas',
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
];

List<Widget> getAcoes(BuildContext context) => [
  itemAcoes(
    'Novo',
    Icon(Icons.add, color: AppColor.textColorPrimary, size: 25),
    AdicionarTransacaoPage(),
    context,
  ),
  itemAcoes(
    'Metas',
    Icon(Icons.bar_chart_outlined, color: AppColor.textColorPrimary, size: 25),
    AdicionarTransacaoPage(),
    context,
  ),
  itemAcoes(
    'Categorias',
    Icon(Icons.category, color: AppColor.textColorPrimary, size: 25),
    AdicionarTransacaoPage(),
    context,
  ),
];



final List listaCategorias = [
  categoria(
    Icon(Icons.videogame_asset, size: 25, color: AppColor.textColorPrimary),
    'Lazer',
    0.50,
    AppColor.yellow,
  ),
  categoria(
    Icon(Icons.home, size: 25, color: AppColor.textColorPrimary),
    'Casa',
    0.75,
    AppColor.celestialBlue,
  ),
  categoria(
    Icon(Icons.shopping_cart_sharp, size: 25, color: AppColor.textColorPrimary),
    'Compras',
    0.67,
    AppColor.liveGreen,
  ),
];
