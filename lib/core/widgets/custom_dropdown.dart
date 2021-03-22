import 'package:appex_accounting/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> list;
  final Function onChange;
  final String hintText;
  final Color backgroundColor;
  final double width;
  final double height;
  final String initialize;

  const CustomDropdown({
    Key key,
    @required this.list,
    @required this.onChange,
    @required this.hintText,
    @required this.backgroundColor,
    @required this.initialize,
    this.width,
    this.height,
  }) : super(key: key);

  Widget build(BuildContext context) {
    //
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      width: width,
      height: height,
      alignment: Alignment.center,
      child: DropdownButtonFormField<String>(
        style: TextStyle(color: AppColor.bluish),
        iconEnabledColor: AppColor.bluish,
        focusColor: AppColor.secondary,
        dropdownColor: AppColor.tertiary,
        value: initialize.isNotEmpty ? initialize : null,
        items: list
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(e),
                ),
              ),
            )
            .toList(),
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
