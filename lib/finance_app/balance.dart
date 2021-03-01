import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const backgroundColor = Colors.black;
const primaryColor = Color.fromARGB(255, 254, 117, 47);

class FinanceAppBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.copyWith(
      textTheme: GoogleFonts.montserratTextTheme(theme.textTheme),
      accentColor: primaryColor,
    );

    return MaterialApp(
      theme: customTheme,
      home: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Container(
            constraints: BoxConstraints.expand(),
            color: backgroundColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    child: SafeArea(
                      child: Column(
                        children: [
                          _topBar(),
                          _yourBalanceHeader(),
                          _yourBalanceBody()
                        ],
                      ),
                    ),
                  ),
                  _yourBalanceChart(),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: SafeArea(
                      child: Column(
                        children: [
                          _periodSelector(),
                          SizedBox(height: 16),
                          _yourBalanceOverview(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _yourBalanceOverview() {
    return Column(
      children: [
        _balanceOverviewItem('Income', '75%', Icons.arrow_downward),
        _balanceOverviewItem('Outcome', '25%', Icons.arrow_upward),
      ],
    );
  }

  Widget _balanceOverviewItem(
      String title, String variation, IconData iconData) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
          Row(
            children: [
              Text(
                variation,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                iconData,
                color: Colors.white,
                size: 16,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _periodSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Text(
            'Apr to Jun',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _periodItem('1', 'Month'),
        _periodItem('6', 'Month'),
        _periodItem('1', 'Year'),
      ],
    );
  }

  Widget _periodItem(String amount, String unit) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7.5),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Text(
            amount,
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
          Text(
            unit,
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _yourBalanceChart() {
    return Container(
      child: AspectRatio(
        aspectRatio: 3 / 1.8,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: BalanceChartPainter(),
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * .22,
                  bottom: constraints.maxHeight * .3,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * .13,
                  bottom: constraints.maxHeight * .45,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      '5 June',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _yourBalanceBody() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Money Received',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withAlpha(128),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$27,802.05',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '15%',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _yourBalanceHeader() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your Balance',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 24,
            height: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class BalanceChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, size.height / 1.05);
    // Point 1
    path.cubicTo(
      size.width / 6,
      size.height / 1.05,
      size.width / 8,
      size.height / 1.5,
      size.width / 4,
      size.height / 1.5,
    );
    // Point 2
    path.cubicTo(
      size.width / 3,
      size.height / 1.5,
      size.width / 3,
      size.height / 1.1,
      size.width / 2,
      size.height / 1.1,
    );
    // Point 3
    path.cubicTo(
      size.width / 1.5,
      size.height / 1.1,
      size.width / (4 / 3),
      size.height / 2.25,
      size.width / (10 / 9),
      size.height / 2.25,
    );
    // Point 4
    path.cubicTo(
      size.width / 1.06,
      size.height / 2.25,
      size.width / 1.02,
      size.height / 2,
      size.width,
      size.height / 1.75,
    );

    var shadowPath = Path();
    shadowPath.addPath(path, Offset.zero);
    shadowPath.lineTo(size.width, size.height);
    shadowPath.lineTo(0, size.height);
    shadowPath.close();

    canvas.drawPath(
      shadowPath,
      Paint()
        ..color = Colors.red
        ..shader = ui.Gradient.linear(
          Offset.zero,
          Offset(0, size.height),
          [
            primaryColor,
            primaryColor.withAlpha(10),
          ],
        ),
    );

    canvas.drawPath(
      path,
      Paint()
        ..color = primaryColor
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
