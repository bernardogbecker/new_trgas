import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'Logica.dart';
import 'package:universal_html/html.dart' as html;

String documentpath;
var docFirestore;
writeOnPdf(bool fromFirestore) async {
  final trImage = pw.MemoryImage(
    (await rootBundle.load('imagens/Logo.png')).buffer.asUint8List(),
  );
  String gasescolhido;
  if (gn) {
    gasescolhido = 'GN';
  } else {
    gasescolhido = 'GLP';
  }
  double perdadepressao =
      100 - trechosGlobal.last.pfinal / trechosGlobal.first.pinicial * 100;
  List<List<dynamic>> data = [];
  data = dadosParaTabela(fromFirestore, gasescolhido);
  var pdf = pw.Document();
  pdf.addPage(pw.MultiPage(
    pageFormat: PdfPageFormat.a4,
    margin: pw.EdgeInsets.all(10),
    orientation: pw.PageOrientation.landscape,
    build: (pw.Context context) {
      return <pw.Widget>[
        pw.Header(
            level: 0, child: pw.Text("Trichês Engenharia | $nomedoProjeto")),
        pw.Table.fromTextArray(context: context, data: data),
        pw.SizedBox(
          height: 20,
        ),
        pw.Row(
          children: [
            pw.Spacer(),
            pw.Text(
                'Perda de pressão total: ${perdadepressao.toStringAsFixed(2)}%'),
          ],
        ),
        pw.SizedBox(
          height: 5,
        ),
        pw.Row(
          children: [
            pw.Spacer(),
            pw.Text('Perda de pressão máxima permitida: 35.00%'),
          ],
        ),
        pw.Spacer(),
        pw.Row(
          children: [
            pw.Spacer(),
            pw.Image(trImage, height: 30),
          ],
        ),
      ];
    },
  ));
  return pdf;
}

Future<void> savePdf(pdf) async {
  Directory documentDirectory = await getApplicationDocumentsDirectory();
  String newdirectory = nomedoProjeto;
  documentpath = documentDirectory.path + '/' + newdirectory;

  File file = File(documentpath);
  file.writeAsBytesSync(await pdf.save());
  OpenFile.open(documentpath);
}

Future<void> writeOnandSavePdf() async {
  var pdf = await writeOnPdf(false);
  await savePdf(pdf);
}

Future<void> openPDF(BuildContext context) async {
  if (kIsWeb) {
    final pdf = writeOnPdf(false);
    final bytes = await pdf.save();
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrl(blob);
    html.window.open(url, "_blank");
    html.Url.revokeObjectUrl(url);
  } else {
    await writeOnandSavePdf();
  }
}

List dadosParaTabela(bool comefromFirestore, String gasescolhido) {
  List<List<dynamic>> data = [];
  data.add(
    <String>[
      'Trecho',
      'Pot. Comp.',
      'FS%',
      'Pot. Adot.',
      'Vazão $gasescolhido',
      'V (m/s)',
      'L hor. (m)',
      'Desníveis (m)',
      'Leq(m)',
      'LTotal(m)',
      'P inicial',
      'P final',
      'DeltaP',
      'P. de carga',
      'D NOM. (pol)',
    ],
  );
  if (comefromFirestore) {
    Map dados = docFirestore["Dados"];
    print(dados);
    dados.forEach((key, value) {
      data.add(value);
    });
  } else {
    for (DadosTrechos dados in trechosGlobal) {
      data.add(dados.textstoShow);
    }
  }
  return data;
}

Future<void> writeOnandSavePdfFromFirestore() async {
  var pdf = await writeOnPdf(true);
  await savePdf(pdf);
}
