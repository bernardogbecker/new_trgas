import 'package:flutter/material.dart';
import '../widgetsTR.dart';
import '../constants.dart';
import '../Logica.dart';

class TrechosScreen extends StatefulWidget {
  @override
  _TrechosScreenState createState() => _TrechosScreenState();
}

class _TrechosScreenState extends State<TrechosScreen> {
  List<Widget> children = [];
  TextEditingController _trecho;
  void initState() {
    trechosGlobal.clear();
    super.initState();
    _trecho = TextEditingController();
  }

  void dispose() {
    _trecho.dispose();
    super.dispose();
  }

  void addTrecho({@required trecho, @required size}) {
    var newTrecho = Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: ChooseButton(
            size: size, texto: trecho, padding: false, changesize: 0.05));
    children.add(SizedBox(height: 15));
    children.add(newTrecho);
    setState(() {});
    var newInfo = DadosTrechos();
    newInfo.nome = trecho;
    trechosGlobal.add(newInfo);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FundoTrGas(
      size: size,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            'Adicione os trechos:',
            style: ktextTituloStyle.copyWith(fontSize: 34),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: double.infinity,
          height: size.height * 0.3,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: children,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WriteButton(
                size: size,
                labeltext: 'Digite o nome do trecho',
                controller: _trecho,
              ),
              ChooseSmallerButton(
                size: size,
                texto: 'Confirmar',
                onTap: () {
                  addTrecho(trecho: _trecho.text, size: size);
                  _trecho.clear();
                },
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackIconButton(size: size),
            ForwardIconButton(
              size: size,
              onPressed: () {
                if (trechosGlobal.isNotEmpty)
                  Navigator.pushNamed(context, 'comprimentosScreen');
              },
            ),
          ],
        ),
        LogoTr(size: size),
      ],
    );
  }
}
