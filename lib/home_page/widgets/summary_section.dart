import 'package:appex_accounting/home_page/widgets/summary_page_content.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

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
      child: Row(
        children: List.generate(
          3,
          (index) => SummaryPageContent(
            index: index,
            pageNumber: pageNumber,
          ),
        ),
      ),
    );
  }
}
