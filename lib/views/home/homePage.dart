import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/models/transacao.dart';
import 'package:saldopro/views/utils/homePageUtils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<Transacoes>(context, listen: false).getAllFunctions();
    });
  }

  
  @override
  Widget build(BuildContext context) {
    final transacoes = context.watch<Transacoes>();
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColor.gradientGreen,
          backgroundColor: AppColor.branco,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          onRefresh: () => Future.delayed(Duration.zero,() {
            transacoes.getAllFunctions();
          },),
          child: SingleChildScrollView(
            child: Padding(
              padding: .all(10),
          
              // coluna principal
              child: Column(
                spacing: 30,
                children: [
                  Row(
                    mainAxisAlignment: .end,
                    spacing: 10,
                    children: [
                      
                      Icon(
                        Icons.notifications,
                        size: 25,
                        color: AppColor.textColorPrimary,
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://admin.faculdademalta.edu.br/media/profile_images/71cca382-04c5-43f0-b026-df41a99214a0.jpg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          
                  Column(
                    spacing: 10,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 10 * 100,
                            padding: .all(12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColor.gradientRed,
                                  AppColor.gradientGreen,
                                ],
                              ),
                              borderRadius: .circular(10),
                            ),
          
                            child: Row(
                              spacing: 5,
                              children: [
                                Icon(
                                  Icons.handshake,
                                  size: 40,
                                  color: AppColor.textColorPrimary,
                                ),
          
                                Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      'Olá, Alisson',
                                      style: TextStyle(
                                        color: AppColor.branco,
                                        fontSize: 16,
                                        height: 0,
                                      ),
                                    ),
                                    Text(
                                      'Bem vindo ao SaldoPro!',
                                      style: TextStyle(
                                        color: AppColor.branco,
                                        fontSize: 16,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
          
                      Container(
                        width: 10 * 100,
                        padding: .all(20),
                        decoration: BoxDecoration(
                          color: AppColor.backgroundCard,
                          borderRadius: .circular(10),
                        ),
          
                        child: Row(
                          spacing: 10,
                          children: [
                            Container(
                              padding: .all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.gradientGreen,
                              ),
                              child: Icon(
                                Icons.monetization_on,
                                size: 25,
                                color: AppColor.textColorPrimary,
                              ),
                            ),
          
                            Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  'Você gastou',
                                  style: TextStyle(
                                    color: AppColor.branco,
                                    fontSize: 14,
                                    fontWeight: .bold,
                                  ),
                                ),
                                transacoes.isLoading ?
                                loadTotal()
          
                                :Text(
                                  'R\$ ${transacoes.total}',
                                  style: TextStyle(
                                    color: AppColor.branco,
                                    fontSize: 25,
                                    fontWeight: .bold,
                                  ),
                                )
          
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 5,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Geral',
                            style: TextStyle(
                              color: AppColor.textColorPrimary,
                              fontSize: 14,
                              fontWeight: .bold,
                            ),
                          ),
                          Text(
                            'Ver mais >',
                            style: TextStyle(
                              color: AppColor.textColorPrimary,
                              fontSize: 14,
                              fontWeight: .bold,
                            ),
                          ),
                        ],
                      ),
          
                      SizedBox(
                        height: 85,
                        child: ListView.separated(
                          scrollDirection: .horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10),
                          itemCount: items.length,
                          itemBuilder: (context, index) => items[index],
                        ),
                      ),
                    ],
                  ),
          
                  Column(
                    spacing: 5,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Ações',
                            style: TextStyle(
                              color: AppColor.textColorPrimary,
                              fontSize: 14,
                              fontWeight: .bold,
                            ),
                          ),
                          // Text(
                          //   'Ver mais >',
                          //   style: TextStyle(
                          //     color: AppColor.textColorPrimary,
                          //     fontSize: 14,
                          //     fontWeight: .bold,
                          //   ),
                          // ),
                        ],
                      ),
          
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: getAcoes(context),
                      ),
                    ],
                  ),
          
                  Column(
                    spacing: 5,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Recentes',
                            style: TextStyle(
                              color: AppColor.textColorPrimary,
                              fontSize: 14,
                              fontWeight: .bold,
                            ),
                          ),
                          Text(
                            'Ver mais >',
                            style: TextStyle(
                              color: AppColor.textColorPrimary,
                              fontSize: 14,
                              fontWeight: .bold,
                            ),
                          ),
                        ],
                      ),
          
                      SizedBox(
                        height: 200,
                        child: 
                        transacoes.isLoading ?
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 4),
                          itemCount: 3,
                          itemBuilder: (context, index) {                          
                            return loadRecentes();
                          },
                          
                        )
          
                        :ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 4),
                          itemCount: 3,
                          
                          itemBuilder: (context, index) {
                            final item = transacoes.transacoes[index];
                            
                            return recentes(
                              item.descricao.toString(),
                              item.tipo.toString(),
                              item.valor.toString(),
                              item.criadoEm.toString(),
                            );
                          },
                          
                        ),
                      )
                    ],
                    
                  ),
          
                  Column(
                    spacing: 5,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Categorias',
                            style: TextStyle(
                              color: AppColor.textColorPrimary,
                              fontSize: 14,
                              fontWeight: .bold,
                            ),
                          ),
                          Text(
                            'Ver mais >',
                            style: TextStyle(
                              color: AppColor.textColorPrimary,
                              fontSize: 14,
                              fontWeight: .bold,
                            ),
                          ),
                        ],
                      ),
          
                      Container(
                        padding: .all(20),
                        decoration: BoxDecoration(
                          color: AppColor.backgroundCard,
                          borderRadius: .circular(10),
                        ),
                        child: SizedBox(
                          height: 130,
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listaCategorias.length,
                            separatorBuilder: (context, index) => SizedBox(height: 12,),
                            itemBuilder: (context, index) => listaCategorias[index],
                              
                              
          
                          ),
                        ),
                      ),
                    ],
                  ),
          
          
                  Container(
                    padding: .all(10),
                    decoration: BoxDecoration(
                      color: AppColor.backgroundCard,
                      borderRadius: .circular(10),
                      gradient: LinearGradient(colors: [AppColor.gradientBlue, AppColor.gradientGreenSecondary])
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          spacing: 3,
                          crossAxisAlignment: .center,
                          children: [
                            Icon(Icons.star, size: 20, color: AppColor.textColorPrimary,),
                            Text('Avalie essa tela', style: TextStyle(color: AppColor.textColorPrimary, fontSize: 14, fontWeight: .bold),)
                          ],
                        ),
                  
                        Row(
                          children: [
                            Icon(Icons.star, size: 20, color: AppColor.textColorPrimary,),
                            Icon(Icons.star, size: 20, color: AppColor.textColorPrimary,),
                            Icon(Icons.star, size: 20, color: AppColor.textColorPrimary,),
                            Icon(Icons.star, size: 20, color: AppColor.textColorPrimary,),
                            Icon(Icons.star, size: 20, color: AppColor.textColorPrimary,),
                          ],
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
