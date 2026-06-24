import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saldopro/colors/colors.dart';
import 'package:saldopro/views/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .all(10),
          child: Column(
            spacing: 10,
            mainAxisAlignment: .center,
            children: [

              Row(
                mainAxisAlignment: .center,
                children: [
                  Text('Saldo', style: TextStyle(color: AppColor.textColorPrimary, fontSize: 35),),
                  Text('Pro', style: TextStyle(color: AppColor.yellow, fontSize: 35, fontWeight: .w900 ),)
                ],
              ),

              SizedBox(height: 10,),

              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: AppColor.branco, fontWeight: .bold),
                decoration: InputDecoration(
                  
                  hintText: 'email@exemplo.com',
                  hintStyle: TextStyle(color: AppColor.backgroundProgress),
                  filled: true,
                  fillColor: AppColor.backgroundCard,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: .circular(10)
                  ),
          
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: .circular(10)
                  ),
                ),
                cursorColor: AppColor.branco,
              ),
          
              TextField(
                keyboardType: TextInputType.datetime,
                style: TextStyle(color: AppColor.branco, fontWeight: .bold),
                
                decoration: InputDecoration(
                  
                  hintText: 'Sua senha',
                  hintStyle: TextStyle(color: AppColor.backgroundProgress),
                  filled: true,
                  fillColor: AppColor.backgroundCard,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: .circular(10)

                  ),
          
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: .circular(10)

                  ),
                ),
                cursorColor: AppColor.branco,
              ),

              SizedBox(height: 20,),
          
              GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  width: .infinity,
                  padding: .all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [AppColor.gradientBlue, AppColor.celestialBlue]),
                    borderRadius: .circular(10)

                  ),

                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text('Entrar', style: TextStyle(color: AppColor.textColorPrimary, fontWeight: .bold, fontSize: 16),),

                      Icon(Icons.login, color: AppColor.gradientBlue, size: 25,)
                    ],
                  )
                ),
              ),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  GestureDetector(
                    child: Text('Esqueci minha senha', style: TextStyle(color: AppColor.textColorPrimary, fontWeight: .bold),),
                  ),
                  GestureDetector(
                    child: Text('Cadastre-se', style: TextStyle(color: AppColor.textColorPrimary, fontWeight: .bold),),
                  ),
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
