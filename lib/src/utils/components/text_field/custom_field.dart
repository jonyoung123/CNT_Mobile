import 'package:cnt_mobile/src/utils/constants/colors.dart';
import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.label = "",
    this.hasLabel = true,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.onTap,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType,
    this.style,
    this.inputFormatters,
    this.prefixIcon,
    this.maxLength,
    this.obscureText = false,
    this.suffixIcon,
    this.hintText = "",
    this.textInputAction = TextInputAction.done,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChanged,
    this.onFieldSubmitted,
    this.isView = true,
  });
  final bool? isView;
  final bool hasLabel;
  final String label;
  final bool readOnly;
  final TextEditingController? controller;
  final TextStyle? style;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final String hintText;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: !hasLabel
              ? null
              : label.textStyled(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.brown100,
                ),
        ),
        SizedBox(height: hasLabel ? 10 : 0),
        TextFormField(
          autovalidateMode: autovalidateMode,
          validator: validator,
          controller: controller,
          readOnly: readOnly,
          onFieldSubmitted: onFieldSubmitted,
          style: TextStyle(
              color: readOnly ? AppColors.black.withOpacity(0.5) : AppColors.black,
              fontSize: 16,
              fontFamily: GoogleFonts.inter().fontFamily,
              fontWeight: FontWeight.w400),
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          cursorColor: Theme.of(context).colorScheme.primary,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          obscuringCharacter: "*",
          keyboardType: keyboardType ?? const TextInputType.numberWithOptions(decimal: true, signed: true),
          textInputAction: textInputAction,
          onChanged: onChanged,
          onTap: onTap,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle:
                TextStyle(color: AppColors.black.withOpacity(0.3), fontSize: 16, fontFamily: GoogleFonts.inter().fontFamily, fontWeight: FontWeight.w400),
            fillColor: AppColors.white,
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: AppColors.black, width: 0.5)),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.redAccent,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.redAccent,
              ),
            ),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: AppColors.black, width: 0.5)),
            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: AppColors.black, width: 0.5)),
          ),
        )
      ],
    );
  }
}
