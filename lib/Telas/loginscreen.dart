import 'package:flutter/material.dart';
import 'package:new_trgas/Firebase.dart';
import '../Firebase.dart';
import '../constants.dart';
import '../widgetsTR.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();

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
                            controller: _email,
                          ),
                          WriteLoginButton(
                            size: size,
                            iconData: Icons.lock_open,
                            titulo: 'Senha',
                            controller: _senha,
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
                                  onTap: () {
                                    registerToFirebase(
                                      context: context,
                                      senha: _senha.text,
                                      email: _email.text,
                                    );
                                  },
                                ),
                                LoginButton(
                                  texto: 'Login',
                                  size: size,
                                  onTap: () {
                                    loginToFirebase(
                                      context: context,
                                      senha: _senha.text,
                                      email: _email.text,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    LoginWithButton(
                      size: size,
                      onTap: () {
                        signInWithGoogle(context: context);
                      },
                    ),
                    LogoTr(size: size),
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
