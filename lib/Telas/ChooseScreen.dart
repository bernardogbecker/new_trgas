import 'package:flutter/material.dart';
import 'package:new_trgas/widgetsTR.dart';
import 'package:new_trgas/constants.dart';

class ChooseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FundoTrGas2(
      size: size,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            'O que desejas fazer?',
            style: ktextTituloStyle.copyWith(fontSize: 34),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChooseButton(
                size: size,
                texto: 'Novo Cálculo',
                onTap: () {
                  Navigator.pushNamed(context, 'multiResidencialScreen');
                },
              ),
              SizedBox(
                height: 30,
              ),
              ChooseButton(
                size: size,
                texto: 'Ver Histórico',
                onTap: () {},
              ),
            ],
          ),
        ),
        LogoTr(size: size),
      ],
    );
  }
}
