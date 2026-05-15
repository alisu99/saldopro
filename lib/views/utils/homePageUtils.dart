import 'package:flutter/material.dart';
import 'package:saldopro/colors/colors.dart';

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
              nome,
              style: TextStyle(
                color: AppColor.textColorPrimary,
                fontSize: 16,
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
                fontSize: 18,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget itemAcoes(String nome, Icon icon) {
  return Container(
    padding: .all(1.5),
    decoration: BoxDecoration(
      borderRadius: .circular(10),
      color: AppColor.backgroundCard,
      gradient: LinearGradient(
        colors: [AppColor.gradientRed, AppColor.gradientGreen],
      ),
    ),
    child: Container(
      padding: .all(10),
      width: 120,
      decoration: BoxDecoration(
        color: AppColor.backgroundCard,
        borderRadius: .circular(10),
      ),

      child: Column(
        mainAxisAlignment: .spaceAround,
        children: [
          icon,
          Text(
            nome,
            style: TextStyle(
              color: AppColor.textColorPrimary,
              fontSize: 16,
              fontWeight: .bold,
            ),
          ),
        ],
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
                Text(
                  descricao,
                  style: TextStyle(
                    color: AppColor.textColorPrimary,
                    fontSize: 16,
                    fontWeight: .bold,
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
              valor,
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

final List items = [
  ItemDash('Entradas', Icon(Icons.attach_money_rounded, color: AppColor.textColorPrimary, size: 25), '145,80'),
  ItemDash('Saídas', Icon(Icons.attach_money_rounded, color: AppColor.textColorPrimary, size: 25), '200,00'),
  ItemDash('Saldo', Icon(Icons.wallet, color: AppColor.textColorPrimary, size: 25), '475,80'),
];

final List acoes = [
  itemAcoes('Novo', Icon(Icons.add, color: AppColor.textColorPrimary, size: 25)),
  itemAcoes('Metas', Icon(Icons.bar_chart_outlined, color: AppColor.textColorPrimary, size: 25)),
  itemAcoes('Categorias', Icon(Icons.category, color: AppColor.textColorPrimary, size: 25)),
];

final List itensRecentes = [
  recentes('Gympass', 'Saída', '54,90', '14 de Mai. de 2026'),
  recentes('Volei', 'Saída', '10,00', '11 de Mai. de 2026'),
  recentes('Edson Lanches', 'Saída', '54,90', '10 de Mai. de 2026'),
];


final List listaCategorias = [
  categoria(Icon(Icons.videogame_asset, size: 25, color: AppColor.textColorPrimary,), 'Lazer', 0.50, AppColor.yellow),
  categoria(Icon(Icons.home, size: 25, color: AppColor.textColorPrimary,), 'Casa', 0.75, AppColor.celestialBlue),
  categoria(Icon(Icons.shopping_cart_sharp, size: 25, color: AppColor.textColorPrimary,), 'Compras', 0.67, AppColor.liveGreen),
];