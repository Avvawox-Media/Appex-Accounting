import 'package:appex_accounting/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TableRowItem extends StatefulWidget {
  final Widget content;

  const TableRowItem({Key key, this.content}) : super(key: key);
  @override
  _TableRowItemState createState() => _TableRowItemState();
}

class _TableRowItemState extends State<TableRowItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      // margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.highlight.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: widget.content,
    );
  }
}
