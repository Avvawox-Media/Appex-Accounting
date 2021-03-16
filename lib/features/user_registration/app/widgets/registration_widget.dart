import 'package:appex_accounting/core/utils/colors.dart';
import 'package:appex_accounting/core/validation/field_validator.dart';
import 'package:appex_accounting/dialogs/notification_dialog.dart';
import 'package:appex_accounting/features/user_registration/app/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class RegistrationWidget extends StatefulWidget {
  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  String genderValue = '';
  String roleValue = '';

  List<String> genderList = ['Male', 'Female'];
  List<String> roleList = ['Regular', 'Administrator'];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Shopping List Bloc
  final registrationBloc = sl<RegistrationBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (context) => registrationBloc,
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationLoading) {
            NotificationDialog(context).showLoadingDialog();
            print('Loading...');
          } else if (state is RegistrationLoaded) {
            print('Loaded...');
            Navigator.pop(context);
            Navigator.pop(context);
            NotificationDialog(context).showSuccessDialog(
              'Success!',
              'Registration Successful',
            );
          }
        },
        builder: (context, state) => Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              //Registration Icon
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 35.0, top: 20.0),
                child: Icon(
                  Icons.person_add_alt_1_rounded,
                  color: AppColor.bluish,
                  size: 50.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Name TextField
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        width: 250.0,
                        height: 45.0,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: nameController,
                          style: TextStyle(color: AppColor.bluish),
                          autocorrect: false,
                          enabled: true,
                          onEditingComplete: () {},
                          decoration: InputDecoration(
                            hintText: 'Surname First',
                            hintStyle: TextStyle(
                                color: AppColor.bluish.withOpacity(0.5)),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppColor.bluish,
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(48.0),
                              borderSide: BorderSide(
                                width: 2.0,
                                color: AppColor.bluish,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Email TextField
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        width: 250.0,
                        height: 45.0,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: emailController,
                          style: TextStyle(color: AppColor.bluish),
                          autocorrect: false,
                          enabled: true,
                          onEditingComplete: () {},
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                                color: AppColor.bluish.withOpacity(0.5)),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppColor.bluish,
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(48.0),
                              borderSide: BorderSide(
                                width: 2.0,
                                color: AppColor.bluish,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Phone Number TextField
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        width: 250.0,
                        height: 45.0,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: phoneController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                          ],
                          style: TextStyle(color: AppColor.bluish),
                          autocorrect: false,
                          enabled: true,
                          onEditingComplete: () {},
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.allow('0-9')
                          // ],
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                color: AppColor.bluish.withOpacity(0.5)),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: AppColor.bluish,
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(48.0),
                              borderSide: BorderSide(
                                width: 2.0,
                                color: AppColor.bluish,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    width: 15.0,
                  ),

                  //Right Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Gender Field
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        width: 250.0,
                        height: 45.0,
                        alignment: Alignment.center,
                        child: DropdownButtonFormField<String>(
                          style: TextStyle(color: AppColor.bluish),
                          iconEnabledColor: AppColor.bluish,
                          dropdownColor: AppColor.secondary,
                          // value: genderValue,
                          onChanged: (String value) {
                            setState(() {
                              genderValue = value;
                            });
                          },
                          items: genderList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(e),
                                  ),
                                ),
                              )
                              .toList(),
                          decoration: InputDecoration(
                            hintText: 'Select Gender',
                            hintStyle: TextStyle(
                                color: AppColor.bluish.withOpacity(0.5)),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 5.0,
                              vertical: 10.0,
                            ),
                            prefixIcon: Icon(
                              Icons.person_pin_sharp,
                              color: AppColor.bluish,
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
                          ),
                        ),
                      ),

                      //Role Field
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        width: 250.0,
                        height: 45.0,
                        alignment: Alignment.center,
                        child: DropdownButtonFormField<String>(
                          style: TextStyle(color: AppColor.bluish),
                          iconEnabledColor: AppColor.bluish,
                          dropdownColor: AppColor.secondary,
                          onChanged: (String value) {
                            setState(() {
                              roleValue = value;
                            });
                            print(roleValue);
                          },
                          items: roleList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(e),
                                  ),
                                ),
                              )
                              .toList(),
                          decoration: InputDecoration(
                            hintText: 'Select Role',
                            hintStyle: TextStyle(
                                color: AppColor.bluish.withOpacity(0.5)),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 5.0,
                              vertical: 10.0,
                            ),
                            prefixIcon: Icon(
                              Icons.table_rows,
                              size: 18.0,
                              color: AppColor.bluish,
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
                          ),
                        ),
                      ),

                      //Password TextField
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        width: 250.0,
                        height: 45.0,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          autocorrect: false,
                          enabled: true,
                          style: TextStyle(color: AppColor.bluish),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: AppColor.bluish.withOpacity(0.5)),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColor.bluish,
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(48.0),
                              borderSide: BorderSide(
                                width: 2.0,
                                color: AppColor.bluish,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
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
                          dispatchRegistrationnEvent(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            gender: genderValue,
                            password: passwordController.text,
                            role: roleValue,
                          );
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
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    registrationBloc.close();
  }

  void dispatchRegistrationnEvent({
    @required String name,
    String staffId,
    @required String role,
    @required String email,
    @required String phone,
    @required String gender,
    @required String password,
  }) {
    final List nameParts = name.split(' ');
    String formattedName = '';

    for (String value in nameParts) {
      String first = value.substring(0, 1).toUpperCase();
      formattedName += value.replaceRange(0, 1, first) + ' ';
    }

    registrationBloc.add(RegisterUserEvent(formattedName.trim(), staffId, role,
        email.toLowerCase(), phone, password, gender));
  }

  FieldValidator validateInput() {
    if (nameController.text.isEmpty) {
      print('Please enter user\'s full name');

      return FieldValidator(
          validate: false,
          title: 'Input Error',
          message: 'Please enter user\'s full name1');
    } else if (emailController.text.isEmpty) {
      print('Please enter user\'s email');
      return FieldValidator(
          validate: false,
          title: 'Input Error',
          message: 'Please enter user\'s email');
    } else if (phoneController.text.isEmpty) {
      print('Please enter user\'s phone number');
      return FieldValidator(
          validate: false,
          title: 'Input Error',
          message: 'Please enter user\'s phone number');
    } else if (genderValue.isEmpty) {
      print('Please select user\'s gender');
      return FieldValidator(
          validate: false,
          title: 'Input Error',
          message: 'Please select user\'s gender');
    } else if (roleValue.isEmpty) {
      print('Please select user\'s role');
      return FieldValidator(
          validate: false,
          title: 'Input Error',
          message: 'Please select user\'s role');
    } else if (passwordController.text.isEmpty) {
      print('Please choose a password');
      return FieldValidator(
          validate: false,
          title: 'Input Error',
          message: 'Please choose a password');
    } else {
      print('Successful');
      return FieldValidator(validate: true);
    }
  }
}
