import 'package:cnt_mobile/src/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.size = 20,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size),
      child: Divider(
        thickness: 0.5,
        color: AppColors.brown100.withOpacity(0.5),
      ),
    );
  }
}
