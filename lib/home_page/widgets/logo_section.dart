import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Image(
        image: AssetImage('lib/core/images/appex_title.png'),
        fit: BoxFit.contain,
        height: 20.0,
      ),
    );
  }
}
