import 'package:appex_accounting/core/utils/colors.dart';
import 'package:flutter/material.dart';

class MasterPageView extends StatefulWidget {
  final int pageNumber;

  const MasterPageView({Key key, @required this.pageNumber}) : super(key: key);

  @override
  _MasterPageViewState createState() => _MasterPageViewState();
}

class _MasterPageViewState extends State<MasterPageView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return selectedPage(widget.pageNumber);
  }

  Widget selectedPage(int pageNumber) {
    //Select Page
    switch (pageNumber) {
      case 0:
        return Container(
          alignment: Alignment.center,
          child: Text('Jobs & Dervices'),
        );
      case 1:
        return Container(
          alignment: Alignment.center,
          child: Text('Finances'),
        );
      case 2:
        return Container(
          alignment: Alignment.center,
          child: TextField(),
        );
      case 3:
        return Container(
          alignment: Alignment.center,
          child: Text('Customer Base'),
        );
      case 4:
        return Container(
          alignment: Alignment.center,
          child: Text('Manage Users'),
        );
      default:
        return Container(
          alignment: Alignment.center,
          child: Text('Manage Users'),
        );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
