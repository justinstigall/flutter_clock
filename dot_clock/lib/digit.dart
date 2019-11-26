import 'package:flutter/material.dart';
import 'dart:ui';

class Digit extends StatelessWidget {
  const Digit({
    @required this.color,
    @required this.digitNumber,
  })  : assert(color != null),
        assert(
            (digitNumber != null) && ((digitNumber >= 0) && digitNumber <= 9));

  // Digit Color
  final Color color;

  // Digit to draw (0-9)
  final int digitNumber;

  @override
  Widget build(BuildContext context) => new Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            AspectRatio(
                aspectRatio: (5.0 / 3.98) / 3.0,
                child: CustomPaint(
                    painter:
                        _DigitPainer(color: color, digitNumber: digitNumber)))
          ]));
}

class _DigitPainer extends CustomPainter {
  const _DigitPainer({
    @required this.color,
    @required this.digitNumber,
  })  : assert(color != null),
        assert(
            (digitNumber != null) && ((digitNumber >= 0) && digitNumber <= 9));

  // Digit Color
  final Color color;

  // Digit to draw (0-9)
  final int digitNumber;

  @override
  void paint(Canvas canvas, Size size) {

    double dotsize = size.width / 10.0;

    double margin = 10.0 ;

    double width = size.width - margin;
    double height = size.height - margin;
    double left = 0 + margin;
    double right = width;
    double top = 0 + margin;
    double bottom = height;

    double sOffset = 3.0;

    void drawDots(Paint background,Paint shaddow, Paint foreground) {
      canvas.drawRRect(RRect.fromLTRBR(left + sOffset, top + sOffset, right + sOffset, bottom + sOffset, Radius.circular(20.0)), shaddow);
      canvas.drawRRect(RRect.fromLTRBR(left, top, right, bottom, Radius.circular(20.0)), background);
      canvas.drawLine(new Offset(left + margin,height / 2.0), new Offset(right - margin, height / 2.0), foreground);

      switch (digitNumber) {
        case 0: {}
          break;

        case 1:
          {
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0) * 3), dotsize, foreground);
            
            
            
          }
          break;

          case 2:
          {
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0)), dotsize, foreground);
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0) * 3), dotsize, foreground);
          }
          break;

          case 3:
          {
            // Top
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0)), dotsize, foreground);

            // Bottom
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 13), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 17), dotsize, foreground);
          }
          break;

          case 4:
          {
            // Top
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0)), dotsize, foreground);

            // Bottom
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 13), dotsize, foreground);
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0) * 3), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 17), dotsize, foreground);
          }
          break;

          case 5:
          {
            // Top
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 3), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 7), dotsize, foreground);

            // Bottom
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 13), dotsize, foreground);
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0) * 3), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 17), dotsize, foreground);
          }
          break;

          case 6:
          {
            // Top
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 3), dotsize, foreground);
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0)), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 7), dotsize, foreground);

            // Bottom
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 13), dotsize, foreground);
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0) * 3), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 17), dotsize, foreground);
          }
          break;

          case 7:
          {
            // Top
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 3), dotsize, foreground);
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0)), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 7), dotsize, foreground);

            // Bottom
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 13), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 13), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 17), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 17), dotsize, foreground);
          }
          break;

          case 8:
          {
            // Top
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 3), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 3), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 7), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 7), dotsize, foreground);

            // Bottom
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 13), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 13), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 17), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 17), dotsize, foreground);
          }
          break;

          case 9:
          {
            // Top
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 3), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 3), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 7), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 7), dotsize, foreground);

            // Bottom
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 13), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 13), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 6), (bottom / 20.0) * 17), dotsize, foreground);
            canvas.drawCircle(new Offset(((size.width / 20) * 14), (bottom / 20.0) * 17), dotsize, foreground);
            canvas.drawCircle(new Offset(size.width / 2, (bottom / 4.0) * 3), dotsize, foreground);
          }
          break;

        default:
          {
            throw new Exception("bad number");
          }
          break;
      }
    }

    final paintBackground = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..color = Colors.white;
    final paintBackgroundShaddow = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..color = Colors.grey;
    final paintForeground = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..color = Colors.black;
    drawDots(paintBackground, paintBackgroundShaddow, paintForeground);
  }

  @override
  bool shouldRepaint(_DigitPainer old) => (old.digitNumber != digitNumber);
}
