import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static responseSnackBar(BuildContext context, Color color, String message, time) {
    final snackBar = SnackBar(
        // margin: EdgeInsets.only(
        //   bottom: MediaQuery.of(context).size.height * 0.8,
        //   left: 10,
        //   right: 10,
        // ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: time),
        padding: const EdgeInsets.all(6),
        elevation: 0.15,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        content: Center(child: message.textStyled(fontSize: 14, color: color)));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
