import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class SplashPage extends StatelessWidget {
  final bool isSplashed;

  const SplashPage({Key key, this.isSplashed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('lib/core/images/appex_logo.png'),
              width: MediaQuery.of(context).size.height * 0.3,
              isAntiAlias: true,
            ),
            //   Text(
            //     'Appex',
            //     style: TextStyle(fontSize: 32.0, color: Colors.white),
            //   // ),
          ],
        ),
      ),
    );
  }
}
