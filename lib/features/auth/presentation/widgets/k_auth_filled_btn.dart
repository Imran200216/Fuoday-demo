import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class KAuthFilledBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final BorderRadiusGeometry borderRadius;

  const KAuthFilledBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 48,
    this.width = double.infinity,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 0,
        ),
        onPressed: () {
          HapticFeedback.mediumImpact();

          onPressed();
        },
        child: Text(
          text,
          style: GoogleFonts.sora(
            color: textColor,
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
