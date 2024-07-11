import 'package:cnt_mobile/src/utils/constants/colors.dart';
import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton({
    super.key,
    this.onPressed,
    required this.label,
  });
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.black200),
        ),
      ),
      child: label.interStyled(
        color: AppColors.gold100,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
