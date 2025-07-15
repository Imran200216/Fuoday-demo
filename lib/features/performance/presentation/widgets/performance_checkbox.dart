import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/core/themes/app_colors.dart';

class KCheckbox extends StatelessWidget {
  final String text;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color? activeColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;

  const KCheckbox({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.fontWeight = FontWeight.w500,
    this.fontSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor ?? AppColors.primaryColor,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              onChanged(!value);
            },
            child: KText(
              text: text,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontSize: fontSize ?? 12.sp,
              color: textColor ?? AppColors.titleColor,
            ),
          ),
        ),
      ],
    );
  }
}