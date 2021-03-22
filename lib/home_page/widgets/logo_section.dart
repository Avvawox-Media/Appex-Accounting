import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      child: Image(
        image: AssetImage('lib/core/images/appex_title.png'),
        fit: BoxFit.contain,
        height: 30.0,
      ),
    );
  }
}
