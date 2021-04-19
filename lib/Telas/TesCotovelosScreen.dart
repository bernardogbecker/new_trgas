import 'package:flutter/material.dart';
import '../Logica.dart';
import '../widgetsTR.dart';
import '../constants.dart';

class TesCotovelosScreen extends StatefulWidget {
  @override
  _TesCotovelosScreenState createState() => _TesCotovelosScreenState();
}

class _TesCotovelosScreenState extends State<TesCotovelosScreen> {
  List<Widget> children = [];
  Size size;
  String trechoDaVez = '';
  int cotovelos90 = 0;
  int cotovelos45 = 0;
  int tes = 0;
  int count = 0;
  @override
  void initState() {
    trechoDaVez = trechosGlobal[0].nome;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return FundoTrGas2(
      size: size,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            'Tês e Cotovelos',
            style: ktextTituloStyle.copyWith(fontSize: 34),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            trechoDaVez,
            style: ktextTituloStyle.copyWith(fontSize: 34),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Container(
            width: double.infinity,
            height: size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChooseButton(
                  size: size,
                  texto: 'Cotovelos 90°\n$cotovelos90',
                  padding: false,
                  onTap: () {
                    setState(() {
                      cotovelos90 += 1;
                    });
                  },
                ),
                ChooseButton(
                  size: size,
                  texto: 'Cotovelos 45°\n$cotovelos45',
                  padding: false,
                  onTap: () {
                    setState(() {
                      cotovelos45 += 1;
                    });
                  },
                ),
                ChooseButton(
                  size: size,
                  texto: 'Tês\n$tes',
                  padding: false,
                  onTap: () {
                    setState(() {
                      tes += 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackIconButton(size: size),
            ForwardIconButton(
              size: size,
              onPressed: () {
                if (count < trechosGlobal.length) {
                  trechosGlobal[count].tes = tes;
                  trechosGlobal[count].cotovelos90 = cotovelos90;
                  trechosGlobal[count].cotovelos45 = cotovelos45;
                  count += 1;
                  setState(() {
                    if (count < trechosGlobal.length) {
                      trechoDaVez = trechosGlobal[count].nome;
                    }
                    cotovelos45 = 0;
                    cotovelos90 = 0;
                    tes = 0;
                  });
                }
                if (count == trechosGlobal.length) {
                  Navigator.pushNamed(context, 'potenciaInstaladaScreen');
                }
              },
            ),
          ],
        ),
        LogoTr(size: size),
      ],
    );
  }
}
