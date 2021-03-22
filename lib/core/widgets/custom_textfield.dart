import 'package:appex_accounting/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final Function onChange;
  final String hintText;
  final Color backgroundColor;
  final double width;
  final double height;
  final TextEditingController controller;
  final bool numberOnly;

  const CustomTextField({
    Key key,
    @required this.onChange,
    @required this.hintText,
    @required this.backgroundColor,
    @required this.numberOnly,
    this.width,
    this.height,
    @required this.controller,
  }) : super(key: key);

  Widget build(BuildContext context) {
    // String dropdownValue = '';

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      width: width,
      height: height,
      alignment: Alignment.center,
      child: TextField(
        style: TextStyle(color: AppColor.bluish),
        autocorrect: false,
        inputFormatters:
            numberOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
        onChanged: (String value) {
          onChange(value);
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.bluish.withOpacity(0.5)),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 3.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(48.0),
            borderSide: BorderSide(
              width: 2.0,
              color: AppColor.bluish,
            ),
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
        ),
      ),
    );
  }
}
