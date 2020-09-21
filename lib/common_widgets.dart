import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';

void showSingleButtonDialog(
    String title, String body, String buttonText, BuildContext context) async {
// flutter defined function
  await showDialog(
    context: context,
    builder: (BuildContext context) {
// return object of type Dialog
      return AlertDialog(
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(10)),
        title: Text(
          title,
          style: dialogTitleStyle,
        ),
        content: Text(
          body ?? "",
          style: dialogContentStyle,
        ),
        actions: <Widget>[
// usually buttons at the bottom of the dialog
          FlatButton(
            child: Text(buttonText, style: dialogAffirmativeButtonStyle),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<String> showTwoButtonDialog(String title, String body,
    String buttonText1, buttonText2, BuildContext context,
    {bool isDestructive = false}) async {
// flutter defined function
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
// return object of type Dialog
      return AlertDialog(
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(10)),
        title: Text(
          title,
          style: dialogTitleStyle,
        ),
        content: Text(
          body ?? "",
          style: dialogContentStyle,
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          FlatButton(
            child: Text(buttonText1, style: dialogAffirmativeButtonStyle),
            onPressed: () async {
              Navigator.pop(context, "1");
            },
          ),
          FlatButton(
            child: Text(buttonText2, style: dialogNegativeButtonStyle),
            onPressed: () async {
              Navigator.pop(context, "2");
            },
          ),
        ],
      );
    },
  );
}

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: lodadingSurfaceColor,
          child: Center(
            child: SpinKitDoubleBounce(
              color: secondaryColor,
              size: 50.0,
            ),
          ),
        );
      });
}
