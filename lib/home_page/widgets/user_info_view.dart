import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class UserInfoView extends StatefulWidget {
  @override
  _UserInfoViewState createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: AppColor.highlight.withOpacity(0.5)),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48.0),
                  color: AppColor.highlight.withOpacity(0.5)),
            ),
          ),
        ],
      ),
    );
  }
}
