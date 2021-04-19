import 'dart:convert';
import 'package:flutter/material.dart';
import '../Logica.dart';
import '../widgetsTR.dart';
import '../constants.dart';

class PotenciaInstaladaScreen extends StatefulWidget {
  @override
  _PotenciaInstaladaScreenState createState() =>
      _PotenciaInstaladaScreenState();
}

class _PotenciaInstaladaScreenState extends State<PotenciaInstaladaScreen> {
  List<Widget> children = [];
  int count = 0;
  String trechoDaVez = '';
  bool shouldCreate = true;
  @override
  void initState() {
    trechoDaVez = trechosGlobal[0].nome;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FundoTrGas2(
      size: size,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            'Potência Instalada',
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
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1 - 10),
          child: Container(
            width: double.infinity,
            height: size.height * 0.45,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = potenciaInstalada[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ChooseButton(
                      size: size,
                      changesize: 0.07,
                      changeTextsize: 12,
                      padding: false,
                      texto: '${item["Aparelho"]}\n${item["Contagem"]}',
                      onTap: () {
                        item["Contagem"] = item["Contagem"] + 1;
                        setState(() {});
                      }),
                );
              },
              itemCount: potenciaInstalada.length,
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
                  List potencianew =
                      json.decode(json.encode(potenciaInstalada));
                  trechosGlobal[count].potenciasSalvas = potencianew;
                  for (Map item in potenciaInstalada) {
                    item['Contagem'] = 0;
                  }
                  count += 1;
                }
                if (count == trechosGlobal.length) {
                  Navigator.pushNamed(context, 'diametrosScreen');
                } else {
                  trechoDaVez = trechosGlobal[count].nome;
                  setState(() {});
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
