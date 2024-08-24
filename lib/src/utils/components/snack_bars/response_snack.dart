import 'package:cnt_mobile/src/utils/components/snack_bars/snack_bar.dart';
import 'package:cnt_mobile/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

showSnack(BuildContext context, String responseCode, String message, {int time = 2}) {
  switch (responseCode) {
    case "200":
      return CustomSnackBar.responseSnackBar(context, AppColors.black100, message, time);
    case "201":
      return CustomSnackBar.responseSnackBar(context, AppColors.black100, message, time);
    case "202":
      return CustomSnackBar.responseSnackBar(context, AppColors.black100, message, time);
    case "400":
      return CustomSnackBar.responseSnackBar(context, AppColors.brown100, message, time);
    case "401":
      return CustomSnackBar.responseSnackBar(context, AppColors.black100, message, time);
    default:
      return CustomSnackBar.responseSnackBar(context, AppColors.brown100, message, time);
  }
}
