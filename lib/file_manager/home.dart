import 'dart:math';
import 'dart:ui' as ui;

import 'package:dribbble_repros/task_manager/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

final backgroundColor = Color.fromARGB(255, 23, 23, 33);
final darkerGray = Color.fromARGB(255, 44, 44, 52);
final darkGray = Color.fromARGB(255, 73, 73, 75);
final yellow = Color.fromARGB(255, 254, 185, 90);
final red = Color.fromARGB(255, 238, 120, 108);
final turquoise = Color.fromARGB(255, 32, 191, 169);
final pink = Color.fromARGB(255, 242, 200, 238);

class FileManagerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(theme.textTheme),
    );

    return AnnotatedRegion(
      child: MaterialApp(
        theme: customTheme,
        home: Scaffold(
          body: Container(
            color: backgroundColor,
            child: SafeArea(
              child: Column(
                children: [
                  _topBar(),
                  Expanded(
                    child: ListView(
                      children: [
                        _statusCard(),
                        Container(
                          padding: EdgeInsets.all(24),
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              _statusItemCard('Photos', 25, 4524, pink),
                              _statusItemCard('Songs', 75, 250, yellow),
                              _statusItemCard('Videos', 85, 320, turquoise),
                              _statusItemCard('Documents', 55, 1200, red),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      value: SystemUiOverlayStyle.light,
    );
  }

  Widget _statusItemCard(
    String title,
    double percentage,
    int amountOfItems,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: darkerGray,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/file-manager/empty-folder.svg',
                color: color,
                width: 55,
              ),
              SvgPicture.asset(
                'assets/file-manager/vertical-dots-menu-button.svg',
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            amountOfItems.toString(),
            style: TextStyle(
              color: Colors.white.withAlpha(128),
              fontSize: 12,
            ),
          ),
          Text(
            '${percentage.toInt()}%',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Container(
            height: 6,
            margin: EdgeInsets.only(top: 4),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: CustomPaint(
              painter: StorageProgressIndicatorPainter(percentage),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusCard() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: darkerGray,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          CustomPaint(
            painter: StorageStatusCirclePainter(),
            child: Container(
              width: 120,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '70%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Used',
                    style: TextStyle(
                      color: Colors.white.withAlpha(128),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statusSection(
                'Total Space',
                '256GB',
                [darkGray],
              ),
              _statusSection(
                'Used',
                '180GB',
                [
                  yellow,
                  pink,
                  turquoise,
                  red,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusSection(String title, String value, List<Color> colors) {
    final statusDotSize = 20.0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: statusDotSize + 8 + (colors.length - 1) * statusDotSize / 2,
          height: statusDotSize,
          margin: EdgeInsets.only(bottom: 2),
          child: Stack(
            children: [
              for (var i = 0; i < colors.length; i++) ...{
                Positioned(
                  right: i * statusDotSize * 0.4 + 8,
                  child: Container(
                    height: statusDotSize,
                    width: statusDotSize,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: darkerGray,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(statusDotSize / 2),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors[colors.length - i - 1],
                        borderRadius: BorderRadius.all(
                          Radius.circular(statusDotSize / 2),
                        ),
                      ),
                    ),
                  ),
                ),
              }
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withAlpha(128),
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _topBar() {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/file-manager/triangle-dots-menu-button.svg',
          ),
          SvgPicture.asset(
            'assets/file-manager/vertical-dots-menu-button.svg',
          ),
        ],
      ),
    );
  }
}

class StorageProgressIndicatorPainter extends CustomPainter {
  final double value;

  StorageProgressIndicatorPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final gradientWidth = 10.0;
    var relativeWidth = size.width * this.value / 100;
    final relativeGradientWidth =
        min(relativeWidth - gradientWidth, gradientWidth) * 1.0;
    relativeWidth = max(relativeWidth - gradientWidth, 0);
    if (relativeWidth > 0) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, relativeWidth, size.height),
        Paint()..color = turquoise,
      );
    }
    if (relativeGradientWidth > 0) {
      final rect = Rect.fromLTWH(
          relativeWidth - 0.25, 0, relativeGradientWidth, size.height);
      canvas.drawRect(
        rect,
        Paint()
          ..shader = LinearGradient(
            colors: [
              turquoise,
              turquoise.withAlpha(0),
            ],
          ).createShader(rect),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class StorageStatusCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 18.0;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2 - strokeWidth / 2,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = darkGray,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2 - strokeWidth / 2,
      ),
      pi * -0.25,
      pi * 0.7,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..color = yellow,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2 - strokeWidth / 2,
      ),
      pi * 0.16,
      pi * 0.55,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..color = red,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2 - strokeWidth / 2,
      ),
      pi * 0.16,
      pi * 0.3,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..color = turquoise,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2 - strokeWidth / 2,
      ),
      pi * 0.16,
      pi * 0.1,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..color = pink,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
