import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class SettingRowWidget extends StatelessWidget {
  const SettingRowWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.switchWidget,
  });
  final String text;
  final VoidCallback? onPressed;
  final Widget? switchWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text.textStyled(
              fontSize: 16,
            ),
            Container(
              child: switchWidget ??
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
