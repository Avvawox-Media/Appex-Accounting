import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class SummaryPageContent extends StatefulWidget {
  final int index;
  final int pageNumber;

  const SummaryPageContent({Key key, this.index, this.pageNumber})
      : super(key: key);

  @override
  _SummaryPageContentState createState() => _SummaryPageContentState();
}

class _SummaryPageContentState extends State<SummaryPageContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: 180.0,
        height: 80.0,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: AppColor.highlight,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary.withOpacity(0.5),
                spreadRadius: 4.0,
                blurRadius: 5.0,
                offset: Offset(2, 10),
              )
            ]),
        child: Text('Tester - ${widget.pageNumber}'),
      ),
    );
  }
}
