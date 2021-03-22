import 'package:appex_accounting/core/utils/colors.dart';
import 'package:appex_accounting/core/dialogs/custom_dialog.dart';
import 'package:appex_accounting/core/widgets/custom_dropdown.dart';
import 'package:appex_accounting/features/services/app/widgets/add_service_view.dart';
import 'package:appex_accounting/features/services/app/widgets/table_row_item.dart';
import 'package:appex_accounting/features/services/domain/entities/service.dart';
import 'package:flutter/material.dart';

class ServiceTableView extends StatefulWidget {
  @override
  _ServiceTableViewState createState() => _ServiceTableViewState();
}

class _ServiceTableViewState extends State<ServiceTableView> {
  ScrollController scrollController = ScrollController();

  int selectedField;
  String monthInFocus = '';

  List<String> monthList = [
    'July, 2020',
    'August, 2020',
    'September, 2020',
    'October, 2020',
    'November, 2020'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          //Details View
          Container(
            height: 60.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomDropdown(
                  width: 250.0,
                  height: 35.0,
                  initialize: monthList.last,
                  list: monthList,
                  onChange: (String value) {
                    setState(() {
                      monthInFocus = value;
                    });
                  },
                  hintText: 'Select Month',
                  backgroundColor: AppColor.bluish,
                ),

                /// Buttons for Adding or Revoving a Service
                /// to/from the database
                Row(
                  children: [
                    //Add Service Button
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(15.0),
                        backgroundColor: AppColor.bluish,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18.0,
                          ),
                          SizedBox(width: 2.0),
                          Text(
                            'Add Service ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        showDialogBox(
                          context,
                          CustomDialog(
                            width: 400.0,
                            height: 500.0,
                            content: AddServiceView(),
                          ),
                        );
                      },
                    ),

                    SizedBox(width: 15.0),

                    //Remove Service Button
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(15.0),
                        backgroundColor: Colors.red.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 18.0,
                          ),
                          SizedBox(width: 2.0),
                          Text(
                            'Remove  ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
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

                //Vertical Divider
                Align(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      top: 0.0,
                      bottom: 0.0,
                    ),
                    constraints: BoxConstraints(maxWidth: 0.50),
                    width: 0.50,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),

                //Right Side of the Services Table View
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    // color: Colors.grey,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: ListView(
                      children: buildDetailItems(
                        Service(
                          title: 'title',
                          description: 'Description',
                          cost: 5000.00,
                          amount: 4000.00,
                          balance: 1000.00,
                          date: 'July 23, 2021',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildDetailItems(Service service) {
    List<Widget> widgets = [];

    for (int index = 0; index < 6; index++) {
      final listTile = Container(
        alignment: Alignment.topLeft,
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getSubText(service, index)[1],
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              getSubText(service, index)[0],
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      );

      widgets.add(listTile);
    }

    return widgets;
  }

  List<String> getSubText(Service service, int index) {
    switch (index) {
      case 0:
        return ['Service Type', service.title];
      case 1:
        return ['Description', service.description];
      case 2:
        return ['Cost of Service', service.cost.toString()];
      case 3:
        return ['Amount Paid', service.amount.toString()];
      case 4:
        return ['Balance Payment', service.balance.toString()];
      case 5:
        return ['Date', service.date.toString()];
      default:
        return ['Additional Info', ''];
    }
  }
}
