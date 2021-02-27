import 'package:appex_accounting/home_page/pages/appex_home.dart';
import 'package:appex_accounting/home_page/pages/splash_page.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'core/utils/colors.dart';

void main() {
  runApp(Appex());

  //Init Custom Windows Settings
  doWhenWindowReady(() {
    final initialSize = Size(860, 600);

    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = 'Appex';

    appWindow.show();
  });
}

class Appex extends StatefulWidget {
  @override
  _AppexState createState() => _AppexState();
}

class _AppexState extends State<Appex> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appex',
      theme: ThemeData(
        primaryColor: AppColor.primary,
        accentColor: AppColor.accent,
      ),
      debugShowCheckedModeBanner: false,
      home: AppexHome(),
      // home: SplashPage(),
    );
  }
}
