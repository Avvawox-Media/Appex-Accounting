import 'package:appex_accounting/core/database/database_helper.dart';
import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/utils/colors.dart';
import 'package:appex_accounting/core/utils/strings.dart';
import 'package:appex_accounting/core/validation/field_validator.dart';
import 'package:appex_accounting/dialogs/custom_dialog.dart';
import 'package:appex_accounting/dialogs/notification_dialog.dart';
import 'package:appex_accounting/features/user_authentication/app/bloc/authentication_bloc.dart';
import 'package:appex_accounting/features/user_registration/app/widgets/registration_widget.dart';
import 'package:appex_accounting/home_page/pages/dashboard.dart';
import 'package:appex_accounting/home_page/widgets/window_control_buttons.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DatabaseHelper helper = DatabaseHelper.instance;

  //TextEditing Controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //Authentication Bloc
  final authenticationBloc = sl<AuthenticationBloc>();

  @override
  void initState() {
    super.initState();
    helper.open(USERS_BOX);
    getTemp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthenticationBloc>(
        create: (context) => authenticationBloc,
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationLoading) {
              NotificationDialog(context).showLoadingDialog();
            } else if (state is AuthenticationError) {
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pop(context);

                DatabaseFailure failure = state.failure;

                NotificationDialog(context).showWarningDialog(
                  failure.title,
                  failure.message,
                );
              });
            } else if (state is AuthenticationDone) {
              Future.delayed(Duration(seconds: 2), () {
                if (state.authenticatedUser.name.isNotEmpty) {
                  Navigator.pop(context);
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(
                        authenticatedUser: state.authenticatedUser,
                      ),
                    ),
                  );
                }
              });
            }
          },
          builder: (context, state) => Container(
            decoration: BoxDecoration(
              color: AppColor.primary,
              image: DecorationImage(
                image: AssetImage('lib/core/images/appex_bg_style.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                //Top Window Control bar
                WindowTitleBarBox(
                  child: Row(
                    children: [
                      Expanded(child: MoveWindow()),
                      WindowControlButtons(),
                    ],
                  ),
                ),
                SizedBox(height: 50.0),

                //////////////////////////////////////
                /// Content Area
                //////////////////////////////////////
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80.0,
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //Login Icon
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.security_rounded,
                                  color: AppColor.bluish,
                                  size: 70.0,
                                ),
                              ),
                              SizedBox(height: 35.0),

                              //Username TextField
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                width: 300.0,
                                height: 45.0,
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: usernameController,
                                  style: TextStyle(color: AppColor.bluish),
                                  autocorrect: false,
                                  autofocus: true,
                                  enabled: true,
                                  onEditingComplete: () {
                                    if (validateInput().validate) {
                                      //Format Input text from the textfield
                                      final usernameFormatted =
                                          usernameController.text.toLowerCase();
                                      final passwordFormatted =
                                          passwordController.text;

                                      dispatchLoginEvent(
                                        usernameFormatted,
                                        passwordFormatted,
                                      );
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                        color:
                                            AppColor.bluish.withOpacity(0.5)),
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                      vertical: 10.0,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 18.0,
                                      color: AppColor.bluish,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(48.0),
                                      borderSide: BorderSide(
                                        width: 2.0,
                                        color: AppColor.bluish,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(48.0),
                                      borderSide: BorderSide(
                                        width: 2.0,
                                        color: AppColor.bluish,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(48.0),
                                      borderSide: BorderSide(
                                        width: 2.0,
                                        color: AppColor.bluish,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //Password TextField
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                width: 300.0,
                                height: 45.0,
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  autocorrect: false,
                                  enabled: true,
                                  onEditingComplete: () {
                                    if (validateInput().validate) {
                                      //Format Input text from the textfield
                                      final usernameFormatted =
                                          usernameController.text.toLowerCase();
                                      final passwordFormatted =
                                          passwordController.text;

                                      dispatchLoginEvent(
                                        usernameFormatted,
                                        passwordFormatted,
                                      );
                                    }
                                  },
                                  style: TextStyle(color: AppColor.bluish),
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        color:
                                            AppColor.bluish.withOpacity(0.5)),
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                      vertical: 10.0,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: 18.0,
                                      color: AppColor.bluish,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(48.0),
                                      borderSide: BorderSide(
                                        width: 2.0,
                                        color: AppColor.bluish,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(48.0),
                                      borderSide: BorderSide(
                                        width: 2.0,
                                        color: AppColor.bluish,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(48.0),
                                      borderSide: BorderSide(
                                        width: 2.0,
                                        color: AppColor.bluish,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (validateInput().validate) {
                                      //Format Input text from the textfield
                                      final usernameFormatted =
                                          usernameController.text.toLowerCase();
                                      final passwordFormatted =
                                          passwordController.text;

                                      dispatchLoginEvent(
                                        usernameFormatted,
                                        passwordFormatted,
                                      );
                                    }
                                  },
                                  child: Text('Login'),
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColor.bluish,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(36.0),
                                    ),
                                    minimumSize: Size(120.0, 50.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //Right Panel
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: 80.0,
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.person_add,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                print('Add user');
                                showDialogBox(
                                    context,
                                    CustomDialog(
                                      width: 600.0,
                                      height: 450.0,
                                      content: RegistrationWidget(),
                                    ));
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            InkWell(
                              child: CircleAvatar(
                                radius: 15.0,
                                backgroundColor:
                                    AppColor.bluish.withOpacity(0.3),
                                child: Icon(
                                  Icons.settings_rounded,
                                  color: Colors.white.withOpacity(0.7),
                                  size: 15.0,
                                ),
                              ),
                              onTap: () {
                                print('Settings');
                                showDialogBox(
                                    context,
                                    CustomDialog(
                                      width: 600.0,
                                      height: 450.0,
                                      content:
                                          Container(child: Text('Settings')),
                                    ));
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dispatchLoginEvent(String username, String password) {
    authenticationBloc.add(AuthenticateUserEvent(username, password));
  }

  void getTemp() async {
    print(await helper.getAllItem(USERS_BOX));
  }

  @override
  void dispose() {
    super.dispose();
    authenticationBloc.close();
  }

  FieldValidator validateInput() {
    if (usernameController.text.isEmpty) {
      NotificationDialog(context).showWarningDialog(
          'Input Error', 'Please enter your registered email');

      return FieldValidator(
          validate: false,
          title: 'Input Error',
          message: 'Please enter your registered email');
    } else if (passwordController.text.isEmpty) {
      NotificationDialog(context)
          .showWarningDialog('Input Error', 'Password field must not be empty');

      return FieldValidator(
          validate: false,
          title: 'Input Error',
          message: 'Password field must not be empty');
    } else {
      return FieldValidator(validate: true);
    }
  }
}
