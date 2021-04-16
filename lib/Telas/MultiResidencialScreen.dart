import 'package:flutter/material.dart';
import '../Logica.dart';
import '../widgetsTR.dart';
import '../constants.dart';

class MultiResidencialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FundoTrGas2(
      size: size,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            'É Multi Residencial?',
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
                texto: 'Sim',
                onTap: () {
                  multiResidencial = true;
                  Navigator.pushNamed(context, 'gasScreen');
                },
              ),
              SizedBox(
                height: 30,
              ),
              ChooseButton(
                size: size,
                texto: 'Não',
                onTap: () {
                  multiResidencial = false;
                  Navigator.pushNamed(context, 'gasScreen');
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
