import 'package:flutter/material.dart';
import '../Firebase.dart';
import '../widgetsTR.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricoScreen extends StatefulWidget {
  @override
  _HistoricoScreenState createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  String filtro = 'Nome';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FundoTrGas(
      size: size,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Text(
            'Histórico',
            style: ktextTituloStyle.copyWith(fontSize: 34),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChooseButton(
                size: size,
                texto: 'Data',
                changesizeWidth: 0.13,
                changeTextsize: 0.02,
                changesize: 0.05,
                padding: false,
                onTap: () {
                  setState(() {
                    filtro = 'Data';
                  });
                },
              ),
              ChooseButton(
                size: size,
                texto: 'Nome',
                padding: false,
                changeTextsize: 0.02,
                changesizeWidth: 0.13,
                changesize: 0.05,
                onTap: () {
                  setState(() {
                    filtro = 'Nome';
                  });
                },
              ),
            ],
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('Projetos').orderBy(filtro).snapshots(),
          builder: (context, snapshot) {
            return Container(
              width: size.width * 0.6,
              height: size.height * 0.4,
              child: (snapshot.connectionState == ConnectionState.waiting)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        var doc = snapshot.data.docs[index];
                        DateTime docDate = doc["Data"].toDate();
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: HistoricoButton(
                              size: size,
                              changesize: 0.07,
                              changeTextsize: 0.015,
                              padding: false,
                              nome: doc['Nome'],
                              dateTime: docDate,
                              onTap: () {}),
                        );
                      },
                      itemCount: snapshot.data.size,
                    ),
            );
          },
        ),
        Row(
          children: [
            BackIconButton(size: size),
            Spacer(),
          ],
        ),
        LogoTr(size: size),
      ],
    );
  }
}
