import 'package:flutter/material.dart';
import '../Logica.dart';
import '../pdfCreateandSave.dart';
import '../widgetsTR.dart';
import '../constants.dart';

class DiametrosScreen extends StatefulWidget {
  @override
  _DiametrosScreenState createState() => _DiametrosScreenState();
}

class _DiametrosScreenState extends State<DiametrosScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double porcentagem = 11;
    return FundoTrGas2(
      size: size,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            'Diâmetros',
            style: ktextTituloStyle.copyWith(fontSize: 34),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: size.height * 0.07,
          width: size.width * 0.8,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var trecho = trechosGlobal[index];
              return ChooseButton(
                size: size,
                texto: '${trecho.nome} |\n${trecho.diametroEscolhido}',
                changesizeWidth: 0.15,
                changeTextsize: 12,
                changePadding: 0.02,
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: ktrigrey1,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.05,
                            horizontal: size.width * 0.1),
                        color: ktrigrey1,
                        child: Column(
                          children: [
                            ChooseDiametro(
                              size: size,
                              texto: 'Diametro 4',
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  trecho.diametroEscolhido = '4';
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ChooseDiametro(
                              size: size,
                              texto: 'Diametro 3',
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  trecho.diametroEscolhido = '3';
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ChooseDiametro(
                              size: size,
                              texto: 'Diametro 2.1/2',
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  trecho.diametroEscolhido = '2.1/2';
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ChooseDiametro(
                              size: size,
                              texto: 'Diametro 2',
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  trecho.diametroEscolhido = '2';
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ChooseDiametro(
                              size: size,
                              texto: 'Diametro 1.1/2',
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  trecho.diametroEscolhido = '1.1/2';
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ChooseDiametro(
                              size: size,
                              texto: 'Diametro 1.1/4',
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  trecho.diametroEscolhido = '1.1/4';
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ChooseDiametro(
                              size: size,
                              texto: 'Diametro 1',
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  trecho.diametroEscolhido = '1';
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ChooseDiametro(
                              size: size,
                              texto: 'Diametro 3/4',
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  trecho.diametroEscolhido = '3/4';
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ChooseDiametro(
                              size: size,
                              texto: 'Diametro 1/2',
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  trecho.diametroEscolhido = '1/2';
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ChooseDiametro(
                              size: size,
                              texto: 'Diametro 3/8',
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  trecho.diametroEscolhido = '3/8';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            itemCount: trechosGlobal.length,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            'Pressões',
            style: ktextTituloStyle.copyWith(fontSize: 34),
            textAlign: TextAlign.center,
          ),
        ),
        ChooseButton(
          size: size,
          texto: trechosGlobal[0].pinicial.toString(),
          changesizeWidth: 0.15,
          changeTextsize: 12,
          changePadding: 0.05,
          changesize: 0.05,
          onTap: () {
            showModalBottomSheet(
              backgroundColor: ktrigrey1,
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  child: AddTaskScreen(
                    size: size,
                    onTap: (String pinicial) {
                      trechosGlobal[0].pinicial = double.parse(pinicial);
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            );
          },
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Text(
                'Iniciais | Finais',
                style: ktextTituloStyle.copyWith(fontSize: 34),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: size.height * 0.2,
              width: size.width * 0.8,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  var trecho = trechosGlobal[index];
                  return Center(
                    child: Text(
                      '${trecho.pinicial}   ${trecho.nome}    ${trecho.pfinal}',
                      style: ktextTituloStyle.copyWith(fontSize: 30),
                    ),
                  );
                },
                itemCount: trechosGlobal.length,
              ),
            ),
          ],
        ),
        Container(
          width: size.width * 0.6,
          height: size.height * 0.05,
          decoration: BoxDecoration(
            color: ktriblue,
            boxShadow: [shadow1black, shadow1blue],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Perda de pressão: $porcentagem %',
                style: ktextTituloStyle.copyWith(fontSize: 15),
              ),
              Icon(
                (porcentagem <= 10) ? Icons.check : Icons.close,
                color: Colors.white,
              ),
            ],
          ),
        ),
        ChooseButton(
          size: size,
          texto: 'Ver resultado completo',
          changesize: 0.05,
          changeTextsize: 15,
          onTap: () async {
            showModalBottomSheet(
              backgroundColor: ktrigrey1,
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  child: AddNomeScreen(
                    size: size,
                    onTap: (String projeto) async {
                      nomedoProjeto = projeto;
                      Navigator.pop(context);
                      await writeOnandSavePdf();
                      Navigator.pushNamed(
                        context,
                        'pdfScreen',
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
        LogoTr(size: size),
      ],
    );
  }
}
