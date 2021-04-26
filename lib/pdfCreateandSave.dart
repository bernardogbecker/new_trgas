import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'Logica.dart';
import 'package:universal_html/html.dart' as html;

String documentpath;
writeOnPdf() {
  String gasescolhido;
  if (gn) {
    gasescolhido = 'GN';
  } else {
    gasescolhido = 'GLP';
  }
  List<pw.TableRow> tableRows = [
    pw.TableRow(
      children: [
        pw.Text('TRECHO'),
        pw.Text('POTÊNCIA\nCOMPUTADA'),
        pw.Text('FATOR DE \nSIMULANEIDADE'),
        pw.Text('POTÊNCIA\nADOTADA'),
        pw.Text('VAZÃO DO GÁS\n $gasescolhido'),
        pw.Text('V (m/s)'),
        pw.Text('L hor. (m)'),
        pw.Text('Desníveis (m)'),
        pw.Text('Leq (m)'),
        pw.Text('LTotal(m)'),
        pw.Text('P inicial'),
        pw.Text('P final'),
        pw.Text('DeltaP'),
        pw.Text('P. de carga'),
        pw.Text('D NOM. (pol)'),
        pw.Text('Resultado'),
      ],
    ),
  ];

  var pdf = pw.Document();
  pdf.addPage(pw.MultiPage(
    pageFormat: PdfPageFormat.a4,
    margin: pw.EdgeInsets.all(10),
    orientation: pw.PageOrientation.landscape,
    build: (pw.Context context) {
      return <pw.Widget>[
        pw.Header(
            level: 0, child: pw.Text("Trichês Engenharia | $nomedoProjeto")),
        pw.Table(border: pw.TableBorder.all(), children: tableRows),
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
}

Future<void> writeOnandSavePdf() async {
  var pdf = writeOnPdf();
  await savePdf(pdf);
  print('oi');
}

Future<void> openPDF(BuildContext context) async {
  if (kIsWeb) {
    final pdf = writeOnPdf();
    final bytes = await pdf.save();
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrl(blob);
    html.window.open(url, "_blank");
    html.Url.revokeObjectUrl(url);
  } else {
    writeOnandSavePdf();
  }
}
