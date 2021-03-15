import 'package:appex_accounting/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NotificationDialog {
  final BuildContext context;

  NotificationDialog(this.context);

  showLoadingDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Material(
        elevation: 3.0,
        type: MaterialType.transparency,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpinKitFadingCube(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.white : AppColor.bluish,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showWarningDialog(String title, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Material(
        elevation: 3.0,
        type: MaterialType.transparency,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_rounded,
                size: 36.0,
                color: Colors.yellow.shade500,
              ),
              SizedBox(height: 40.0),
              Container(
                alignment: Alignment.center,
                width: 350.0,
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                width: 350.0,
                child: Text(
                  message,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                alignment: Alignment.center,
                width: 350.0,
                child: Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Check'),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.bluish,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                      minimumSize: Size(120.0, 50.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSuccessDialog(String title, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Material(
        elevation: 3.0,
        type: MaterialType.transparency,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check,
                size: 36.0,
                color: Colors.green.shade500,
              ),
              SizedBox(height: 40.0),
              Container(
                alignment: Alignment.center,
                width: 350.0,
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                width: 350.0,
                child: Text(
                  message,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                alignment: Alignment.center,
                width: 350.0,
                child: Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Check'),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.bluish,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                      minimumSize: Size(120.0, 50.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
