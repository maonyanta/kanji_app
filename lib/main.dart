import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';

import 'kanjibox.dart';

void main() {
  runApp(const MyApp());
}

Future<Uint8List> makePdf() async {
  final pdf = pw.Document();

  final fontData = await rootBundle.load('fonts/NotoSansJP-Regular.ttf');
  final font = pw.Font.ttf(fontData);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4.landscape,
      build: (pw.Context context) {
        return pw.Center(
          child: KanjiBox(furigana: 'ふりがな', font: font),
        );
      },
    ),
  );

  return pdf.save();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDFサンプル',
      home: Scaffold(
        appBar: AppBar(title: const Text('PDFテスト')),
        body: PdfPreview(build: (format) => makePdf()),
      ),
    );
  }
}
