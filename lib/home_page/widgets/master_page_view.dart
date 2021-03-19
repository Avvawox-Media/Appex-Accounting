import 'package:appex_accounting/features/services/app/widgets/service_table_view.dart';
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

        //Display Jobs and Services Table Widget
        return Container(
          alignment: Alignment.center,
          child: ServiceTableView(),
        );

      case 1:

        //Display Finances Table Widget
        return Container(
          alignment: Alignment.center,
          child: Text('Finances'),
        );

      case 2:

        //Display Finances Table Widget
        return Container(
          alignment: Alignment.center,
          child: TextField(),
        );

      case 3:

        //Display Customer Table Widget
        return Container(
          alignment: Alignment.center,
          child: Text('Customer Base'),
        );

      case 4:

        //Display Users Table Widget
        return Container(
          alignment: Alignment.center,
          child: Text('Manage Users'),
        );

      default:

        //Display Finances Table Widget
        return Container(
          alignment: Alignment.center,
          child: Text('Manage Users'),
        );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
