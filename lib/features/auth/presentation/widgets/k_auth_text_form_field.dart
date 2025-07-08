import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class KAuthTextFormField extends StatelessWidget {
  final String? hintText;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const KAuthTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: GoogleFonts.sora(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.titleColor,
      ),
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: const UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.authUnderlineBorderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.w),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.w),
        ),
        errorStyle: GoogleFonts.sora(
          fontSize: 10.sp,
          color: Colors.red,
        ),
      ),
    );
  }
}

