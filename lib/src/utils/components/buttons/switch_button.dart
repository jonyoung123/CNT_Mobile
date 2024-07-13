import 'package:cnt_mobile/src/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomSwitchButton extends StatelessWidget {
  const CustomSwitchButton({super.key, required this.value, required this.onChanged});
  final bool value;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 40.0, // Adjust the size as needed
        height: 25.0, // Adjust the size as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: value ? AppColors.black : AppColors.black.withOpacity(0.3),
        ),
        child: AnimatedAlign(
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: 27.0, // Adjust the size as needed
            height: 27.0, // Adjust the size as needed
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white, border: Border.all(color: AppColors.black.withOpacity(0.04))),
          ),
        ),
      ),
    );
  }
}
