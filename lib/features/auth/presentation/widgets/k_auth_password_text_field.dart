import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class KAuthPasswordTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const KAuthPasswordTextField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
  });

  @override
  State<KAuthPasswordTextField> createState() => _KAuthPasswordTextFieldState();
}

class _KAuthPasswordTextFieldState extends State<KAuthPasswordTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      style: GoogleFonts.sora(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.titleColor,
      ),
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'Password',
        suffixIcon: IconButton(
          onPressed: _togglePasswordVisibility,
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.titleColor,
          ),
        ),
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
