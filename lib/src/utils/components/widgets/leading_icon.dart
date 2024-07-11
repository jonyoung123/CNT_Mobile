import 'dart:io';

import 'package:cnt_mobile/src/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => Navigator.pop(context),
      icon: Icon(
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
        color: AppColors.black200,
      ),
    );
  }
}
