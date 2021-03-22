import 'dart:io';

import 'package:appex_accounting/core/utils/colors.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final Widget content;

  const CustomDialog({
    Key key,
    @required this.width,
    @required this.height,
    this.color,
    @required this.content,
  }) : super(key: key);
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: widget.content,
    );
  }
}

void showDialogBox(BuildContext context, CustomDialog content) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Material(
      elevation: 3.0,
      type: MaterialType.transparency,
      child: Align(
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),

                    //Close-Dialog Button
                    Container(
                      width: 40.0,
                      height: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(),
                      child: InkWell(
                        child: Icon(
                          Icons.close,
                          color: AppColor.highlight,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Scrollbar(
                  isAlwaysShown: true,
                  hoverThickness: 2.0,
                  radius: Radius.circular(24.0),
                  child: ListView(
                    children: [
                      content,
                    ],
                  ),
                ),
              ),
            ],
          ),
          width: content.width,
          height: content.height,
        ),
      ),
    ),
  );
}
