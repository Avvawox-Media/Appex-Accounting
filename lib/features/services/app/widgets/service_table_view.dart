import 'package:appex_accounting/core/utils/colors.dart';
import 'package:appex_accounting/features/services/app/widgets/table_row_item.dart';
import 'package:flutter/material.dart';

class ServiceTableView extends StatefulWidget {
  @override
  _ServiceTableViewState createState() => _ServiceTableViewState();
}

class _ServiceTableViewState extends State<ServiceTableView> {
  ScrollController scrollController = ScrollController();

  int selectedField;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white.withOpacity(0.1),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          //Details View
          Container(
            height: 40.0,
            color: Colors.white.withOpacity(0.2),
            child: Container(),
          ),
          SizedBox(width: 2.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Main Table View
                Expanded(
                  flex: 7,
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: 40,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: AnimatedContainer(
                          curve: Curves.easeInCubic,
                          duration: Duration(milliseconds: 300),
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: index == selectedField
                                ? AppColor.bluish.withOpacity(0.1)
                                : Colors.transparent,
                            border: Border.all(
                              width: 2.0,
                              color: index == selectedField
                                  ? AppColor.bluish.withOpacity(0.4)
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: [
                              //Service Id
                              Expanded(
                                flex: 2,
                                child: TableRowItem(
                                  content: Text('026334'),
                                ),
                              ),
                              SizedBox(width: 2.0),
                              Expanded(
                                flex: 7,
                                child: TableRowItem(
                                  content: Text('Website Development'),
                                ),
                              ),
                              SizedBox(width: 2.0),
                              Expanded(
                                flex: 1,
                                child: TableRowItem(
                                  content: Text('00'),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedField = index;
                          });
                        },
                      );
                    },
                    addAutomaticKeepAlives: true,
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
