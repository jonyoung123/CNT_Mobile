import 'package:cnt_mobile/src/utils/constants/colors.dart';
import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({
    super.key,
    this.onPressed,
    required this.label,
  });
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        onLongPress: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.black200,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: label.interStyled(
          color: AppColors.green100,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
