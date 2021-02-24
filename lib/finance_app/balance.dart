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
            color: backgroundColor,
            padding: EdgeInsets.all(12),
            child: SafeArea(
              child: Column(
                children: [
                  _topBar(),
                  _yourBalanceHeader(),
                  _yourBalanceBody(),
                ],
              ),
            ),
          ),
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
