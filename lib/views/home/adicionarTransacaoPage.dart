import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/utils/homePageUtils.dart';

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

                children: [
                  Text('Preencha os dados abaixo para adicionar uma nova transação.', style: TextStyle(color: AppColor.textColorPrimary, fontWeight: .bold, fontSize: 16),),
                  
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text('Descrição', style: TextStyle(color: AppColor.gainsboro)),
                      TextField(
                        controller: descricaoController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: AppColor.branco,
                      
                          fontWeight: .bold,
                        ),
                      
                      
                        decoration: InputDecoration(
                          hintText: 'Ex: Vôlei',
                          hintStyle: TextStyle(color: AppColor.backgroundProgress),
                          filled: true,
                          fillColor: AppColor.backgroundCard,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.texto, width: 2),
                          ),
                      
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.texto, width: 2),
                          ),
                        ),
                        cursorColor: AppColor.branco,
                      ),
                    ],
                  ),

                  

                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text('Valor', style: TextStyle(color: AppColor.gainsboro)),
                      TextField(
                        controller: valorController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RealInputFormatter(),
                        ],
                        style: TextStyle(
                          color: AppColor.branco,
                          fontSize: 23,
                          fontWeight: .bold,
                        ),
                      
                        decoration: InputDecoration(
                          
                          prefixText: 'R\$ ',
                          prefixStyle: TextStyle(
                            color: AppColor.branco,
                            fontSize: 25,
                            fontWeight: .bold,
                            
                          ),
                          isDense: true,
                      
                          filled: true,
                          fillColor: AppColor.backgroundCard,
                      
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.texto, width: 2),
                          ),
                      
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.texto, width: 2),
                          ),
                        ),
                      
                        showCursor: false,
                      ),
                    ],
                  ),

                  
                ],
              ),

              GestureDetector(
                onTap: () {
                  transacoes.addTransacao(
                    Transacao(
                      descricao: descricaoController.text,
                      valor: valorController.text,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  padding: .all(12),
                  width: 10 * 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [AppColor.gradientGreen, AppColor.gradientGreenSecondary]),
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
