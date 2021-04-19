import 'package:flutter/material.dart';
import '../Logica.dart';
import '../widgetsTR.dart';
import '../constants.dart';

class ComprimentoScreen extends StatefulWidget {
  @override
  _ComprimentoScreenState createState() => _ComprimentoScreenState();
}

class _ComprimentoScreenState extends State<ComprimentoScreen> {
  List<Widget> children = [];
  Size size;
  bool create = true;

  void createTrechosWidgets() {
    if (create) {
      for (var object in trechosGlobal) {
        Text text = Text(
          object.nome,
          style: ktextTituloStyle.copyWith(fontSize: 20),
        );
        WriteButton writeButton = WriteButton(
          size: MediaQuery.of(context).size,
          labeltext: 'Digite o valor em metros (m)',
          controller: TextEditingController(),
          changeSizeWidth: true,
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            print(value);
            object.comprimentoNormal = double.parse(value);
            print(object.comprimentoNormal);
          },
        );
        Padding finalwriteButton = Padding(
          child: writeButton,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        );
        SizedBox sizedBox = SizedBox(height: 20);
        children.add(text);
        children.add(sizedBox);
        children.add(finalwriteButton);
        children.add(sizedBox);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    createTrechosWidgets();
    create = false;
    return FundoTrGas2(
      size: size,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            'Comprimento Normal L (m)',
            style: ktextTituloStyle.copyWith(fontSize: 34),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: double.infinity,
          height: size.height * 0.45,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: children,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackIconButton(size: size),
            ForwardIconButton(
                size: size,
                onPressed: () =>
                    Navigator.pushNamed(context, 'desniveisScreen')),
          ],
        ),
        LogoTr(size: size),
      ],
    );
  }
}
