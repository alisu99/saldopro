import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/utils/home_page_utils.dart';

class AdicionarTransacaoPage extends StatefulWidget {
  const AdicionarTransacaoPage({super.key});

  @override
  State<AdicionarTransacaoPage> createState() => _AdicionarTransacaoPageState();
}

class _AdicionarTransacaoPageState extends State<AdicionarTransacaoPage> {
  final valorController = TextEditingController(text: '0,00');
  final descricaoController = TextEditingController();
  String? tipo = 'Saída';
  String? categoria = 'Outros';

  @override
  void dispose() {
    valorController.dispose();
    descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transacoes = context.read<Transacoes>();

    return Scaffold(
      appBar: AppBar(title: Text('Nova transação')),
      body: SafeArea(
        child: Padding(
          padding: .all(10),
          // coluna principal
          child: Column(
            mainAxisAlignment: .spaceBetween,
            children: [
              Column(
                spacing: 20,
                crossAxisAlignment: .start,
                children: [
                  Container(
                    width: 10 * 100,
                    padding: .all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColor.gradientRed, AppColor.gradientGreen],
                      ),
                      borderRadius: .circular(10),
                    ),

                    child: Row(
                      spacing: 5,
                      children: [
                        Expanded(
                          child: Text(
                            'Preencha os dados abaixo para adicionar uma nova transação.',
                            style: TextStyle(
                              color: AppColor.branco,
                              fontSize: 16,
                              height: 0,
                              fontWeight: .bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Valor',
                        style: TextStyle(color: AppColor.gainsboro),
                      ),
                      TextField(
                        controller: valorController,
                        autofocus: true,

                        keyboardType: TextInputType.datetime,

                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RealInputFormatter(),
                        ],
                        style: TextStyle(
                          color: AppColor.branco,
                          fontSize: 25,
                          fontWeight: .bold,
                        ),

                        decoration: InputDecoration(
                          contentPadding: .all(0),
                          prefixText: 'R\$ ',

                          prefixStyle: TextStyle(
                            color: AppColor.branco,
                            fontSize: 20,
                            fontWeight: .bold,
                          ),
                          isDense: true,

                          filled: false,
                          fillColor: AppColor.backgroundDark,

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),

                        showCursor: true,
                        cursorColor: AppColor.branco,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: AppColor.backgroundCard,
                                  content: RadioGroup(
                                    groupValue: tipo,
                                    onChanged: (value) {
                                      setState(() {
                                        tipo = value!;
                                      });

                                      Navigator.pop(context);
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Selecione o tipo da transação',
                                          style: TextStyle(
                                            color: AppColor.textColorPrimary,
                                            fontSize: 16,
                                          ),
                                        ),
                                        RadioListTile(
                                          activeColor:
                                              AppColor.gradientGreenSecondary,
                                          horizontalTitleGap: 2,

                                          value: 'Entrada',
                                          title: Text(
                                            'Entrada',
                                            style: TextStyle(
                                              color: AppColor.textColorPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        RadioListTile(
                                          activeColor:
                                              AppColor.gradientGreenSecondary,
                                          horizontalTitleGap: 2,

                                          value: 'Saída',
                                          title: Text(
                                            'Saída',
                                            style: TextStyle(
                                              color: AppColor.textColorPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                'Tipo',
                                style: TextStyle(color: AppColor.gainsboro),
                              ),
                              Row(
                                children: [
                                  Text(
                                    tipo.toString(),
                                    style: TextStyle(
                                      color: AppColor.gradientGreenSecondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: AppColor.gradientGreenSecondary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: AppColor.backgroundCard,
                                  content: RadioGroup(
                                    groupValue: categoria,
                                    onChanged: (value) {
                                      setState(() {
                                        categoria = value!;
                                      });

                                      Navigator.pop(context);
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RadioListTile(
                                          activeColor:
                                              AppColor.gradientGreenSecondary,
                                          horizontalTitleGap: 2,

                                          value: 'Lazer',
                                          title: Text(
                                            'Lazer',
                                            style: TextStyle(
                                              color: AppColor.textColorPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        RadioListTile(
                                          activeColor:
                                              AppColor.gradientGreenSecondary,
                                          horizontalTitleGap: 2,

                                          value: 'Casa',
                                          title: Text(
                                            'Casa',
                                            style: TextStyle(
                                              color: AppColor.textColorPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        RadioListTile(
                                          activeColor:
                                              AppColor.gradientGreenSecondary,
                                          horizontalTitleGap: 2,

                                          value: 'Trabalho',
                                          title: Text(
                                            'Trabalho',
                                            style: TextStyle(
                                              color: AppColor.textColorPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        RadioListTile(
                                          activeColor:
                                              AppColor.gradientGreenSecondary,
                                          horizontalTitleGap: 2,

                                          value: 'Férias',
                                          title: Text(
                                            'Férias',
                                            style: TextStyle(
                                              color: AppColor.textColorPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        RadioListTile(
                                          activeColor:
                                              AppColor.gradientGreenSecondary,
                                          horizontalTitleGap: 2,

                                          value: 'Mercado',
                                          title: Text(
                                            'Mercado',
                                            style: TextStyle(
                                              color: AppColor.textColorPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        RadioListTile(
                                          activeColor:
                                              AppColor.gradientGreenSecondary,
                                          horizontalTitleGap: 2,

                                          value: 'Outros',
                                          title: Text(
                                            'Outros',
                                            style: TextStyle(
                                              color: AppColor.textColorPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                'Categoria',
                                style: TextStyle(color: AppColor.gainsboro),
                              ),
                              Row(
                                children: [
                                  Text(
                                    categoria.toString(),
                                    style: TextStyle(
                                      color: AppColor.gradientGreenSecondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: AppColor.gradientGreenSecondary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Descrição',
                        style: TextStyle(color: AppColor.gainsboro),
                      ),
                      TextField(
                        controller: descricaoController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: AppColor.branco,

                          fontWeight: .bold,
                        ),

                        decoration: InputDecoration(
                          hintText: 'Ex: Vôlei',
                          hintStyle: TextStyle(
                            color: AppColor.backgroundProgress,
                          ),
                          filled: true,
                          fillColor: AppColor.backgroundCard,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        cursorColor: AppColor.branco,
                      ),
                    ],
                  ),
                ],
              ),

              GestureDetector(
                onTap: () {
                  transacoes.addTransacao(
                    Transacao(
                      id: 0,
                      descricao: descricaoController.text,
                      valor: valorController.text,
                      tipo: tipo,
                      categoria: categoria,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  padding: .all(12),
                  width: 10 * 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.gradientBlue,
                        AppColor.gradientGreenSecondary,
                      ],
                    ),
                    borderRadius: .circular(10),
                  ),
                  child: Text(
                    'Adicionar',
                    style: TextStyle(
                      color: AppColor.branco,
                      fontSize: 18,
                      fontWeight: .bold,
                    ),
                    textAlign: .center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
