import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgetsTR.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FundoTrGas(
      size: size,
      children: [
        Text(
          'TRGas',
          style: ktextTRGasStyle,
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                  color: ktriblue,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [shadow0black, shadow0white]),
              child: Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05, bottom: size.height * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bem Vindo!',
                      style: ktextTituloStyle,
                    ),
                    SizedBox(
                      height: size.height * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WriteLoginButton(
                            size: size,
                            iconData: Icons.account_circle,
                            titulo: 'E-mail',
                          ),
                          WriteLoginButton(
                            size: size,
                            iconData: Icons.lock_open,
                            titulo: 'Senha',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LoginButton(
                                  texto: 'Inscreva-se',
                                  size: size,
                                  onTap: () {},
                                ),
                                LoginButton(
                                  texto: 'Login',
                                  size: size,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    LoginWithButton(size: size),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: size.width * 0.8 / 3,
                            child: Image.asset(
                              'imagens/Logo.png',
                              fit: BoxFit.contain,
                            )),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
