import 'package:appex_accounting/core/dialogs/notification_dialog.dart';
import 'package:appex_accounting/core/utils/colors.dart';
import 'package:appex_accounting/core/validation/field_validator.dart';
import 'package:appex_accounting/core/widgets/custom_dropdown.dart';
import 'package:appex_accounting/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddServiceView extends StatefulWidget {
  @override
  _AddServiceViewState createState() => _AddServiceViewState();
}

class _AddServiceViewState extends State<AddServiceView> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final costController = TextEditingController();
  final amountController = TextEditingController();
  final balanceController = TextEditingController();

  //
  String selectedService = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        //Registration Icon
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 35.0, top: 20.0),
          child: Text(
            'Register Transaction',
            style: TextStyle(fontSize: 24.0),
          ),
        ),

        CustomDropdown(
          initialize: '',
          list: ['Design', 'Development'],
          hintText: 'Select Service',
          backgroundColor: Colors.transparent,
          width: 250.0,
          height: 45.0,
          onChange: (value) {
            setState(() {
              selectedService = value;
            });
          },
        ),

        //
        CustomTextField(
          controller: descriptionController,
          numberOnly: true,
          height: 45.0,
          hintText: 'Short description',
          width: 250.0,
          onChange: (value) {},
          backgroundColor: Colors.transparent,
        ),

        //
        CustomTextField(
          controller: costController,
          numberOnly: true,
          height: 45.0,
          hintText: 'Cost of Service',
          width: 250.0,
          onChange: (value) {},
          backgroundColor: Colors.transparent,
        ),

        //
        CustomTextField(
          controller: descriptionController,
          numberOnly: false,
          height: 45.0,
          hintText: 'Amount Paid',
          width: 250.0,
          onChange: (value) {},
          backgroundColor: Colors.transparent,
        ),

        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.secondary.withRed(120),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                  minimumSize: Size(120.0, 50.0),
                ),
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  final validator = validateInput();

                  if (validator.validate) {
                  } else {
                    NotificationDialog(context).showWarningDialog(
                      validator.title,
                      validator.message,
                    );
                  }
                },
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.bluish,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                  minimumSize: Size(120.0, 50.0),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  FieldValidator validateInput() {
    // if (nameController.text.isEmpty) {
    //   print('Please enter user\'s full name');

    //   return FieldValidator(
    //       validate: false,
    //       title: 'Input Error',
    //       message: 'Please enter user\'s full name1');
    // } else if (emailController.text.isEmpty) {
    //   print('Please enter user\'s email');
    //   return FieldValidator(
    //       validate: false,
    //       title: 'Input Error',
    //       message: 'Please enter user\'s email');
    // } else if (phoneController.text.isEmpty) {
    //   print('Please enter user\'s phone number');
    //   return FieldValidator(
    //       validate: false,
    //       title: 'Input Error',
    //       message: 'Please enter user\'s phone number');
    // } else if (genderValue.isEmpty) {
    //   print('Please select user\'s gender');
    //   return FieldValidator(
    //       validate: false,
    //       title: 'Input Error',
    //       message: 'Please select user\'s gender');
    // } else if (roleValue.isEmpty) {
    //   print('Please select user\'s role');
    //   return FieldValidator(
    //       validate: false,
    //       title: 'Input Error',
    //       message: 'Please select user\'s role');
    // } else if (passwordController.text.isEmpty) {
    //   print('Please choose a password');
    //   return FieldValidator(
    //       validate: false,
    //       title: 'Input Error',
    //       message: 'Please choose a password');
    // } else {
    //   print('Successful');
    //   return FieldValidator(validate: true);
    // }
  }
}
