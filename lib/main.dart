import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';
import 'package:appex_accounting/home_page/pages/dashboard.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'features/user_authentication/app/pages/login_page.dart';
import 'core/utils/colors.dart';
import 'injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Init Resource Locator
  await ic.init();

  //Run Base Application
  runApp(Appex());

  //Init Custom Windows Settings
  doWhenWindowReady(() {
    final initialSize = Size(960, 640);

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
      home: Dashboard(
        authenticatedUser: AuthenticatedUser(
            name: 'Ben',
            email: '',
            gender: '',
            password: '',
            role: '',
            phone: '',
            staffId: ''),
      ),
      // home: SplashPage(),
    );
  }
}
