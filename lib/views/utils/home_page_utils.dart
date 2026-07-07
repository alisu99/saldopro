import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/views/home/adicionar_transacao_page.dart';

Widget ItemDash(String tipo, Icon icon, double? money) {
  var corSetada;
  switch (tipo) {
    case "Entradas":
      corSetada = AppColor.gradientGreen;
    case "Saídas":
      corSetada = AppColor.gradientRed;
    case "Saldo":
      corSetada = money!.isNegative
          ? AppColor.gradientRed
          : AppColor.gradientGreen;
    case "Fixas":
      corSetada = AppColor.celestialBlue;
  }
  return Container(
    padding: .symmetric(horizontal: 20),

    decoration: BoxDecoration(
      color: AppColor.backgroundCard,
      borderRadius: .circular(10),
    ),
    child: Row(
      spacing: 5,
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
          NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(money),
          style: TextStyle(color: corSetada, fontSize: 14, fontWeight: .bold),
        ),
      ],
    ),
  );
}

Widget itemAcoes(String nome, Icon icon, rota, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => rota));
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

Widget recentes(String descricao, String tipo, String valor, String criadoEm) {
  bool isSaida = false;
  if (tipo.toString() == 'Saída') {
    isSaida = true;
  }
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
        Expanded(
          child: Row(
            spacing: 10,
            children: [
              Container(
                padding: .all(10),
                decoration: BoxDecoration(
                  color: AppColor.backgroundDark,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.currency_exchange,
                  size: 20,
                  color: isSaida ? AppColor.gradientRed : AppColor.gradientGreen,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      descricao,
                      style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: 16,
                        fontWeight: .bold,
                      ),
                      overflow: .ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      tipo,
                      style: TextStyle(
                        color: AppColor.texto,
                        fontSize: 13,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                color: AppColor.texto,
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
      minHeight: 20,
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

Widget categoria(String nome, double porcentagem, String porcentagemString) {
  var icon;
  var cor;
  switch (nome) {
    case "Lazer": [icon = Icon(Icons.gamepad_outlined, size: 15, color: AppColor.textColorPrimary,), cor = AppColor.yellow];
    case "Trabalho": [icon = Icon(Icons.work_outline, size: 15, color: AppColor.textColorPrimary,), cor = AppColor.orange];
    case "Casa": [icon = Icon(Icons.house_rounded, size: 15, color: AppColor.textColorPrimary,), cor = Colors.purpleAccent];
    case "Férias": [icon = Icon(Icons.sports_soccer, size: 15, color: AppColor.textColorPrimary,), cor = Colors.indigo];
    case "Mercado": [icon = Icon(Icons.shopping_cart, size: 15, color: AppColor.textColorPrimary,), cor = Colors.brown];
    case "Outros": [icon = Icon(Icons.category_outlined, size: 15, color: AppColor.textColorPrimary,),  cor = Colors.teal];
  }

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
            porcentagemString,
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
        value: 1 * porcentagem.toDouble(),
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

List<Widget> getAcoes(BuildContext context) => [
  itemAcoes(
    'Novo',
    Icon(Icons.add, color: AppColor.textColorPrimary, size: 25),
    AdicionarTransacaoPage(),
    context,
  ),
  // itemAcoes(
  //   'Metas',
  //   Icon(Icons.bar_chart_outlined, color: AppColor.textColorPrimary, size: 25),
  //   'Tela de Metas',
  //   context,
  // ),
  // itemAcoes(
  //   'Categorias',
  //   Icon(Icons.category, color: AppColor.textColorPrimary, size: 25),
  //   'Tela de Categorias',
  //   context,
  // ),
];