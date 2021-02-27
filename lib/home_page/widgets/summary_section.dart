import 'package:appex_accounting/core/utils/colors.dart';
import 'package:appex_accounting/home_page/widgets/summary_page_content.dart';
import 'package:flutter/material.dart';

class SummarySection extends StatefulWidget {
  @override
  _SummarySectionState createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  int pageNumber = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: pageNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: List.generate(
              3,
              (index) => buildSummaryTab(index),
            ).toList(),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Row(
                  children: List.generate(
                    3,
                    (index) => SummaryPageContent(
                      index: index,
                      pageNumber: pageNumber,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    3,
                    (index) => SummaryPageContent(
                      index: index,
                      pageNumber: pageNumber,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    3,
                    (index) => SummaryPageContent(
                      index: index,
                      pageNumber: pageNumber,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSummaryTab(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: InkWell(
        child: Container(
          width: 80.0,
          height: 25.0,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: pageNumber == index
                ? AppColor.highlight.withOpacity(0.5)
                : AppColor.primary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        onTap: () {
          setState(() {
            pageNumber = index;
          });

          print(pageNumber);

          pageController.animateToPage(pageNumber,
              duration: Duration(milliseconds: 400), curve: Curves.easeInCirc);
        },
      ),
    );
  }
}
