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
                  Text('BRABO'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
