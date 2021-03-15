import 'package:appex_accounting/core/utils/colors.dart';
import 'package:appex_accounting/dialogs/custom_dialog.dart';
import 'package:appex_accounting/features/user_registration/app/widgets/registration_widget.dart';
import 'package:appex_accounting/home_page/pages/dashboard.dart';
import 'package:appex_accounting/home_page/widgets/window_control_buttons.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                            width: 250.0,
                            height: 45.0,
                            alignment: Alignment.center,
                            child: TextField(
                              style: TextStyle(color: AppColor.bluish),
                              autocorrect: false,
                              enabled: true,
                              onEditingComplete: () {
                                dispatchLoginEvent();
                              },
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                    color: AppColor.bluish.withOpacity(0.5)),
                                alignLabelWithHint: true,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 10.0,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
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
                            width: 250.0,
                            height: 45.0,
                            alignment: Alignment.center,
                            child: TextField(
                              obscureText: true,
                              autocorrect: false,
                              enabled: true,
                              onEditingComplete: () {
                                dispatchLoginEvent();
                              },
                              style: TextStyle(color: AppColor.bluish),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: AppColor.bluish.withOpacity(0.5)),
                                alignLabelWithHint: true,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 10.0,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
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
                                dispatchLoginEvent();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Dashboard(),
                                  ),
                                );
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 30.0),
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
                            backgroundColor: AppColor.bluish.withOpacity(0.3),
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
                                  content: Container(child: Text('Settings')),
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
    );
  }

  void dispatchLoginEvent() {}
}
