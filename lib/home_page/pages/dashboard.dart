import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';
import '../widgets/logo_section.dart';
import '../widgets/master_page_view.dart';
import '../widgets/summary_section.dart';
import '../widgets/tab_button.dart';
import '../widgets/user_info_view.dart';
import '../widgets/window_control_buttons.dart';

class Dashboard extends StatefulWidget {
  final AuthenticatedUser authenticatedUser;

  const Dashboard({
    Key key,
    @required this.authenticatedUser,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPage = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.primary,
        ),

        //Top level windows Container
        child: WindowBorder(
          color: AppColor.tertiary,
          child: Row(
            children: [
              ///////////////////////////////////////////////
              ///Left Side Bar
              ///////////////////////////////////////////////
              Container(
                alignment: Alignment.topCenter,
                width: 240.0,
                height: MediaQuery.of(context).size.height,
                color: AppColor.secondary,
                child: Column(children: [
                  WindowTitleBarBox(
                    child: MoveWindow(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: LogoSection(),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  //Logged in User Profile
                  UserInfoView(authenticatedUser: widget.authenticatedUser),

                  SizedBox(height: 20.0),

                  //Tab Layout
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: List.generate(
                          5,
                          (index) => TabButton(
                                index: index,
                                pageNumber: currentPage,
                                onTap: () {
                                  setState(() {
                                    currentPage = index;
                                  });

                                  //Scroll to Current Page
                                  pageController.animateToPage(
                                    currentPage,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              )),
                    ),
                  ),
                ]),
              ),

              /////////////////////////////////////////////
              /// Righr Larger Area
              /////////////////////////////////////////////
              Expanded(
                child: Container(
                  color: AppColor.primary,
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

                      /// Summary Window
                      Expanded(
                        flex: 3,
                        child: SummarySection(),
                      ),

                      /// Main Content Section
                      Expanded(
                        flex: 7,
                        child: Container(
                            child: Container(
                          child: PageView(
                            controller: pageController,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            pageSnapping: true,
                            children: List.generate(
                              5,
                              (index) => MasterPageView(
                                pageNumber: currentPage,
                              ),
                            ).toList(),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
