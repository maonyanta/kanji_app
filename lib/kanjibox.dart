import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class KanjiBox extends pw.StatelessWidget {
  final String furigana;
  final pw.Font font;
  final double boxSize;
  final double furiganaFontSize;

  KanjiBox({
    required this.furigana,
    required this.font,
    this.boxSize = 60,
    this.furiganaFontSize = 10,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Container(
          width: boxSize,
          height: boxSize,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.black, width: 1),
          ),
        ),
        pw.SizedBox(width: 6),
        // furigana
        pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: furigana
              .split('')
              .map(
                (char) => pw.Text(
                  char,
                  style: pw.TextStyle(font: font, fontSize: furiganaFontSize),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
