import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import '../pdfCreateandSave.dart';

class PdfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: documentpath,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () async {
              File file = File(documentpath);
              await file.delete();
              Navigator.pop(context);
            }),
        title:
            Center(child: IconButton(icon: Icon(Icons.save), onPressed: () {})),
        actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
      ),
    );
  }
}
