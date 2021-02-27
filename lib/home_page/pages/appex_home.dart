import 'package:appex_accounting/core/utils/colors.dart';
import 'package:appex_accounting/home_page/widgets/logo_section.dart';
import 'package:appex_accounting/home_page/widgets/master_page_view.dart';
import 'package:appex_accounting/home_page/widgets/summary_section.dart';
import 'package:appex_accounting/home_page/widgets/tab_button.dart';
import 'package:appex_accounting/home_page/widgets/user_info_view.dart';
import 'package:appex_accounting/home_page/widgets/window_control_buttons.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class AppexHome extends StatefulWidget {
  @override
  _AppexHomeState createState() => _AppexHomeState();
}

class _AppexHomeState extends State<AppexHome> {
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
                  WindowTitleBarBox(child: MoveWindow()),

                  LogoSection(),

                  SizedBox(height: 20.0),

                  //Logged in User Profile
                  UserInfoView(),

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
                  color: AppColor.tertiary,
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
