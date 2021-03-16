import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class UserInfoView extends StatefulWidget {
  final AuthenticatedUser authenticatedUser;

  const UserInfoView({
    Key key,
    @required this.authenticatedUser,
  }) : super(key: key);

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
            alignment: Alignment.center,
            clipBehavior: Clip.hardEdge,
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: AppColor.highlight.withOpacity(0.5)),
            child: Icon(Icons.person, color: Colors.white.withOpacity(0.5)),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              alignment: Alignment.centerLeft,
              height: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48.0),
                  color: AppColor.highlight.withOpacity(0.5)),
              child: Text(
                widget.authenticatedUser.name,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
