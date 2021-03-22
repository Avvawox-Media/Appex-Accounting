import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../core/utils/colors.dart';

class TabButton extends StatefulWidget {
  final int index;
  final int pageNumber;
  final Function onTap;

  const TabButton({
    Key key,
    @required this.onTap,
    @required this.pageNumber,
    this.index,
  }) : super(key: key);

  @override
  _TabButtonState createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: widget.pageNumber == widget.index
            ? AppColor.highlight.withOpacity(0.9)
            : AppColor.tabBtnColor.withOpacity(0.3),
        // border: Border.all(color: AppColor.bluish.withOpacity(0.1)),
      ),
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: InkWell(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              SizedBox(width: 15.0),
              Icon(
                getIcon(widget.index),
                color: AppColor.accent,
                size: 18.0,
              ),
              SizedBox(width: 15.0),
              Text(
                getTitle(widget.index),
                style: TextStyle(color: AppColor.accent),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getTitle(final int index) {
    switch (index) {
      case 0:
        return 'Jobs & Services';
      case 1:
        return 'Finances';
      case 2:
        return 'Enquiries';
      case 3:
        return 'Customer Base';
      case 4:
        return 'Manage Users';
      default:
        return 'Jobs & Services';
    }
  }

  IconData getIcon(final int index) {
    switch (index) {
      case 0:
        return Icons.menu_book;
      case 1:
        return Icons.wallet_membership;
      case 2:
        return Icons.question_answer;
      case 3:
        return Icons.shopping_bag;
      case 4:
        return Icons.group;
      default:
        return Icons.menu_book;
    }
  }
}
