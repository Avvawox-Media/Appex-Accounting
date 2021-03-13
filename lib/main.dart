import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'features/user_authentication/app/pages/login_page.dart';
import 'core/utils/colors.dart';
import 'home_page/pages/appex_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //Run Base Application
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
        accentColor: AppColor.bluish,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: AppColor.bluish,
          ),
          headline6: TextStyle(
            color: AppColor.bluish,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      // home: SplashPage(),
    );
  }
}
