import 'package:dribbble_repros/task_manager/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  AppBar _appBar() {
    return AppBar(
      title: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.tightFor(
          width: 100,
        ),
        child: SvgPicture.asset(
          'assets/logos/dribbble-logo.svg',
          fit: BoxFit.contain,
        ),
      ),
      leading: Container(
        padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
        child: SvgPicture.asset('assets/logos/dribbble-ball-icon.svg'),
      ),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => TaskManagerHome());
            },
            child: Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 200,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Column(
                        children: [
                          FractionallySizedBox(
                            widthFactor: 1,
                            child: Image.network(
                              'https://cdn.dribbble.com/users/1615584/screenshots/15123931/media/569bcd8c984f0ac31f0bc0fbf5ead2ae.jpg?compress=1&resize=1000x750',
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withAlpha(128),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Task Manager',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              'by Ghulam Rasool',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: _appBar(),
        body: _body(context),
      ),
    );
  }
}
