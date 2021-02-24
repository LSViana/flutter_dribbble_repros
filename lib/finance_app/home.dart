import 'dart:ui';

import 'package:dribbble_repros/finance_app/balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

enum CardBrand { visa }

const backgroundColor = Colors.black;
const primaryColor = Color.fromARGB(255, 254, 117, 47);

class FinanceAppHome extends StatelessWidget {
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
                  Expanded(
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            _yourCardsHeader(),
                            _cards(),
                            _recentTransactionsHeader(),
                            _transactions(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _transactions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          _transaction(
            'assets/finance-app/briefcase.svg',
            'Salary',
            'Belong Interactive',
            '+\$2,010',
          ),
          SizedBox(height: 12),
          _transaction(
            'assets/finance-app/paypal.svg',
            'Paypal',
            'Webtech',
            '+\$3,121',
          ),
          SizedBox(height: 12),
          _transaction(
            'assets/finance-app/cog.svg',
            'Car Repair',
            'Car Engine Repair',
            '+\$785',
          ),
        ],
      ),
    );
  }

  Widget _transaction(
    String assetName,
    String title,
    String description,
    String price,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 56,
            width: 56,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: primaryColor,
            ),
            child: SvgPicture.asset(
              assetName,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white.withAlpha(100),
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Text(
            price,
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _recentTransactionsHeader() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Recent Transactions',
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

  Widget _cards() {
    return AspectRatio(
      aspectRatio: 12 / 9,
      child: Container(
        margin: EdgeInsets.only(bottom: 48),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 48,
              right: -48,
              top: 48,
              bottom: -48,
              child: _card(
                primaryColor,
                Colors.white,
                CardBrand.visa,
                '4562 1122 4595 7852',
                'Lucas Viana',
                '24/2020',
              ),
            ),
            Positioned.fill(
              child: _card(
                Colors.grey[900].withAlpha(128),
                Colors.white,
                CardBrand.visa,
                '4562 1122 4595 7852',
                'Lucas Viana',
                '24/2020',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(
    Color backgroundColor,
    Color foregroundColor,
    CardBrand cardBrand,
    String cardNumber,
    String cardHolder,
    String expiryDate,
  ) {
    final sigmaBlur = 16.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaBlur, sigmaY: sigmaBlur),
              child: Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/finance-app/card-chip.svg',
                          color: foregroundColor,
                          width: constraints.maxWidth * 0.1,
                        ),
                        SvgPicture.asset(
                          'assets/finance-app/visa.svg',
                          color: foregroundColor,
                          width: constraints.maxWidth * 0.15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          cardNumber,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: foregroundColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardAttribute(
                            "Card Holder", cardHolder, foregroundColor),
                        _cardAttribute(
                            "Expiry Date", expiryDate, foregroundColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _cardAttribute(String name, String value, Color foregroundColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: foregroundColor.withAlpha(160),
            fontSize: 10,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: foregroundColor,
          ),
        ),
      ],
    );
  }

  Widget _yourCardsHeader() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your Cards',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          Text(
            'You have 3 active cards',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withAlpha(128),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => FinanceAppBalance());
            },
            child: Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
