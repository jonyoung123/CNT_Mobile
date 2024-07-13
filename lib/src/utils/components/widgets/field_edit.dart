import 'package:cnt_mobile/src/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FieldEditWidget extends StatelessWidget {
  const FieldEditWidget({
    super.key,
    this.edit = false,
    this.onTap,
  });
  final bool edit;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: edit
            ? const Icon(
                Icons.close,
                size: 22,
              )
            : SvgPicture.asset(
                AppImages.editIcon,
                height: 18,
                width: 18,
              ),
      ),
    );
  }
}
