import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final yellow = Color.fromARGB(255, 208, 196, 69);
final blue = Color.fromARGB(255, 9, 67, 167);
final grayBlue = Color.fromARGB(255, 31, 34, 75);

final topLeftBlueRadialGradient = RadialGradient(
  center: Alignment.topLeft,
  colors: [
    Color.fromARGB(255, 21, 29, 104),
    Color.fromARGB(255, 19, 19, 27),
  ],
);
final topLeftBlue40RadialGradient = RadialGradient(
  center: Alignment.topLeft,
  colors: [
    Color.fromARGB(102, 21, 29, 104),
    Color.fromARGB(102, 19, 19, 27),
  ],
);
final topLeftBlueGreyRadialGradient = RadialGradient(
  center: Alignment.topLeft,
  colors: [
    Color.fromARGB(255, 21, 29, 104),
    Color.fromARGB(255, 29, 28, 46),
  ],
);

class TaskManagerHome extends StatelessWidget {
  TaskManagerHome() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final customTextTheme = GoogleFonts.nunitoSansTextTheme(
      textTheme,
    );

    return MaterialApp(
      theme: Theme.of(context).copyWith(
        textTheme: customTextTheme,
        accentTextTheme: customTextTheme,
        primaryTextTheme: customTextTheme,
      ),
      home: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    gradient: topLeftBlueRadialGradient,
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _menuButton(),
                                  _userPicture(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        _progressCircle(),
                        _progressStatuses()
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.45,
                  minChildSize: 0.45,
                  maxChildSize: 0.6,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      controller: scrollController,
                      clipBehavior: Clip.none,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            _dailyTasks(context),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dailyTasks(BuildContext context) {
    final theme = Theme.of(context);
    const dayInitials = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    const peoplePictureUrls = [
      'https://images.generated.photos/wYG6UY9j8Omh2JfnxaOFUs_b60DplnJ1DbEWoWAw2Ug/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yz/XzAyNzUyODkuanBn.jpg',
      'https://images.generated.photos/GuxSSpc_c2vpa4Ipjprm2CpStY_vBWqmTT4SWvnjOq8/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yz/XzA0Njk0ODcuanBn.jpg',
      'https://images.generated.photos/wJ17Fkghd7To0OWuqoIczIiguTaMa1M634kr9E4veiI/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yz/XzAzMjAxNzcuanBn.jpg',
      'https://images.generated.photos/blz9Xx5sfzs56P5XuZGCkIbAQu8IH-sFD5cLAmOfh9c/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yz/XzA1NzAyMzguanBn.jpg',
      'https://images.generated.photos/JnYL1WgO6kZBa2KBueCeC9THtwV2CNZQcxwOeHDzDm0/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yz/XzA2OTgyNzcuanBn.jpg'
    ];

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: topLeftBlue40RadialGradient,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: topLeftBlueGreyRadialGradient,
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(128),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              width: 100,
              height: 4,
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create and check',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white.withAlpha(128),
                  ),
                ),
                Text(
                  'Daily Task',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white.withAlpha(128),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Team management and project management with solution provide app.',
              style: TextStyle(
                color: Colors.white.withAlpha(128),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < 7; i++) ...{
                  Container(
                    decoration: i != 1
                        ? null
                        : BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dayInitials[i],
                          style: TextStyle(
                            color: i != 1
                                ? Colors.white.withAlpha(128)
                                : Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 6),
                        Container(
                          height: 24,
                          width: 24,
                          alignment: Alignment.center,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              if (i == 1) ...{
                                Positioned(
                                  top: -4,
                                  right: -4,
                                  child: Container(
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(1000),
                                      ),
                                    ),
                                  ),
                                ),
                              },
                              Positioned(
                                child: Text(
                                  '${i + 12}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                },
              ],
            ),
            SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (var i = 0; i < 5; i++) ...{
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        1000,
                      ),
                    ),
                  ),
                  width: 36,
                  height: 36,
                  child: Image.network(peoplePictureUrls[i]),
                )
              }
            ]),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(1000),
                ),
              ),
              width: 80,
              child: Icon(
                Icons.arrow_right_alt,
                size: 32,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _progressStatuses() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _progressStatusItem(grayBlue, 'To Do'),
          _progressStatusItem(yellow, 'In Progress'),
          _progressStatusItem(blue, 'Completed'),
        ],
      ),
    );
  }

  Widget _progressStatusItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            color: color,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withAlpha(128),
          ),
        ),
      ],
    );
  }

  Widget _progressCircle() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final theme = Theme.of(context);
        final value = 65;

        return Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Container(
            width: constraints.biggest.width * 0.4,
            height: constraints.biggest.width * 0.4,
            child: CustomPaint(
              painter: ProgressCirclePainter(value),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$value%',
                    style: theme.textTheme.headline4.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'Complete',
                    style: theme.textTheme.caption.copyWith(
                      color: Colors.white.withAlpha(128),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _userPicture() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Image.network(
        'https://images.generated.photos/rN2ygnRNFLFo06uHfz5IXzqONJlXYKVD8gT1eCy6L78/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yz/XzAxNDE0MzIuanBn.jpg',
        width: 32,
        height: 32,
      ),
    );
  }

  Container _menuButton() {
    return Container(
      width: 30,
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 3,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(128),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            transform: Transform.translate(
              offset: Offset(0, 8),
            ).transform,
          ),
          Container(
            width: 3,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(128),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          Container(
            width: 3,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(128),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            transform: Transform.translate(
              offset: Offset(0, -8),
            ).transform,
          )
        ],
      ),
    );
  }
}

class ProgressCirclePainter extends CustomPainter {
  final int value;

  ProgressCirclePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final circleStrokeWidth = 20.0;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width / 2 - circleStrokeWidth / 2,
        Paint()
          ..color = grayBlue
          ..style = PaintingStyle.stroke
          ..strokeWidth = circleStrokeWidth);

    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width - circleStrokeWidth,
            height: size.height - circleStrokeWidth),
        pi * -0.25,
        pi * 0.5,
        false,
        Paint()
          ..color = yellow
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = circleStrokeWidth);

    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width - circleStrokeWidth,
            height: size.height - circleStrokeWidth),
        pi * 0.2,
        pi * 0.5,
        false,
        Paint()
          ..color = blue
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = circleStrokeWidth);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is ProgressCirclePainter) {
      return oldDelegate.value != this.value;
    }
    return true;
  }
}
