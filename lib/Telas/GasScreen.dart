import 'package:flutter/material.dart';
import '../widgetsTR.dart';
import '../constants.dart';
import '../Logica.dart';

class GasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FundoTrGas2(
      size: size,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            'Qual o gás utilizado?',
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
                texto: 'Gás Natural',
                onTap: () {
                  gnv = true;
                  Navigator.pushNamed(context, 'trechosScreen');
                },
              ),
              SizedBox(
                height: 30,
              ),
              ChooseButton(
                size: size,
                texto: 'GLP',
                onTap: () {
                  gnv = false;
                  Navigator.pushNamed(context, 'trechosScreen');
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            BackIconButton(size: size),
          ],
        ),
        LogoTr(size: size),
      ],
    );
  }
}
