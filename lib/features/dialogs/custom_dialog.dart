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
    this.width,
    this.height,
    this.color,
    this.content,
  }) : super(key: key);
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void showDialogBox(BuildContext context, CustomDialog dialog) {
  showDialog(
    context: context,
    builder: (context) => Material(
      elevation: 3.0,
      type: MaterialType.transparency,
      child: Align(
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.secondary,
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
              dialog,
            ],
          ),
          width: dialog.width,
          height: dialog.height,
        ),
      ),
    ),
  );
}
