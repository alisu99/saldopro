import 'package:flutter/material.dart';
import 'package:saldopro/colors/cores.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [
              Container(
                height: 370,
                decoration: BoxDecoration(
                  color: AppColor.verdeClaro,
                  borderRadius: .only(
                    bottomLeft: .circular(10),
                    bottomRight: .circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    AppBar(
                      title: Text(
                        'Olá, Alisson!',
                        style: TextStyle(color: AppColor.branco),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility, color: AppColor.branco),
                        ),
                        CircleAvatar(child: Icon(Icons.person)),
                      ],
                    ),
                    SizedBox(height: 25),

                    // cardTotal
                    Container(
                      height: 200,
                      width: 370,
                      padding: .all(25),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: const Color.fromARGB(106, 0, 0, 0),

                            offset: Offset(1, 4),
                          ),
                        ],
                        color: AppColor.verdeEscuro,
                        borderRadius: .all(.circular(10)),
                      ),

                      child: Column(
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    'Total gasto',
                                    style: TextStyle(
                                      color: AppColor.branco,
                                      fontWeight: .bold,
                                    ),
                                  ),
                                  Text(
                                    'R\$ 457,40',
                                    style: TextStyle(
                                      color: AppColor.branco,
                                      fontWeight: .bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),

                              Icon(
                                Icons.calendar_view_month,
                                color: AppColor.branco,
                                size: 50,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // actions1
              Padding(
                padding: .all(20),
                child: Column(
                  crossAxisAlignment: .stretch,
                  spacing: 25,
                  children: [
                    Row(
                      crossAxisAlignment: .start,
                      spacing: 22,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: .all(15),
                                elevation: 0,
                                backgroundColor: AppColor.verdeClaro,
                              ),
                              child: Icon(
                                Icons.monetization_on,
                                size: 40,
                                color: AppColor.branco,
                              ),
                            ),

                            Text(
                              'Nova',
                              style: TextStyle(fontSize: 15, fontWeight: .bold),
                            ),
                            Text(
                              'transação',
                              style: TextStyle(fontSize: 15, fontWeight: .bold),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: .all(15),
                                elevation: 0,
                                backgroundColor: AppColor.verdeClaro,
                              ),
                              child: Icon(
                                Icons.bar_chart_sharp,
                                size: 40,
                                color: AppColor.branco,
                              ),
                            ),

                            Text(
                              'Metas',
                              style: TextStyle(fontSize: 15, fontWeight: .bold),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: .all(15),
                                elevation: 0,
                                backgroundColor: AppColor.verdeClaro,
                              ),
                              child: Icon(
                                Icons.money_off_csred_sharp,
                                size: 40,
                                color: AppColor.branco,
                              ),
                            ),

                            Text(
                              'Despesas',
                              style: TextStyle(fontSize: 15, fontWeight: .bold),
                            ),
                            Text(
                              'fixas',
                              style: TextStyle(fontSize: 15, fontWeight: .bold),
                            ),
                          ],
                        ),
                      ],
                    ),

                    InkWell(
                      onTap: () {},
                      borderRadius: .all(.circular(10)),
                      child: Container(
                        padding: .all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(78, 0, 0, 0),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          spacing: 10,
                          children: [
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    Container(
                                      padding: .all(12),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromARGB(153, 158, 158, 158),
                                      ),
                                      child: Icon(
                                        Icons.monetization_on,
                                        color: const Color.fromARGB(167, 0, 0, 0),
                                        size: 30,
                                      ),
                                    ),

                                    Column(
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text(
                                          'Alisson Gustavo',
                                          style: TextStyle(fontSize: 17, color: const Color.fromARGB(169, 0, 0, 0), fontWeight: .bold),
                                        ),
                                        Text('24 de Nov. de 2025'),
                                      ],
                                    ),
                                  ],
                                ),

                                Text(
                                  'R\$ 25,00',
                                  style: TextStyle(fontSize: 20, fontWeight: .bold, color: const Color.fromARGB(162, 0, 0, 0)),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    Container(
                                      padding: .all(12),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromARGB(153, 158, 158, 158),
                                      ),
                                      child: Icon(
                                        Icons.monetization_on,
                                        color: const Color.fromARGB(167, 0, 0, 0),
                                        size: 30,
                                      ),
                                    ),

                                    Column(
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text(
                                          'Alisson Gustavo',
                                          style: TextStyle(fontSize: 17, color: const Color.fromARGB(169, 0, 0, 0), fontWeight: .bold),
                                        ),
                                        Text('24 de Nov. de 2025'),
                                      ],
                                    ),
                                  ],
                                ),

                                Text(
                                  'R\$ 25,00',
                                  style: TextStyle(fontSize: 20, fontWeight: .bold, color: const Color.fromARGB(162, 0, 0, 0)),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    Container(
                                      padding: .all(12),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromARGB(153, 158, 158, 158),
                                      ),
                                      child: Icon(
                                        Icons.monetization_on,
                                        color: const Color.fromARGB(167, 0, 0, 0),
                                        size: 30,
                                      ),
                                    ),

                                    Column(
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text(
                                          'Alisson Gustavo',
                                          style: TextStyle(fontSize: 17, color: const Color.fromARGB(169, 0, 0, 0), fontWeight: .bold),
                                        ),
                                        Text('24 de Nov. de 2025'),
                                      ],
                                    ),
                                  ],
                                ),

                                Text(
                                  'R\$ 25,00',
                                  style: TextStyle(fontSize: 20, fontWeight: .bold, color: const Color.fromARGB(162, 0, 0, 0)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
