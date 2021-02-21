import 'package:appex_accounting/appex_home.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Appex());

  //Init Custom Windows Settings
  doWhenWindowReady(() {
    final initialSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class Appex extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appex',
      theme: ThemeData(
        primaryColor: Color(0xFF000000),
      ),
      home: AppexHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}


