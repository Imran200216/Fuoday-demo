import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/core/themes/app_colors.dart';

class KUploadPickerTile extends StatelessWidget {
  final String? uploadPickerTitle;
  final IconData uploadPickerIcon;
  final String description;
  final double? spacing;
  final VoidCallback uploadOnTap;

  const KUploadPickerTile({
    super.key,
    this.uploadPickerTitle,
    required this.uploadPickerIcon,
    required this.description,
    this.spacing,
    required this.uploadOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: spacing ?? 6.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Only show title if it's provided
        if (uploadPickerTitle != null)
          KText(
            text: uploadPickerTitle!,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),

        GestureDetector(
          onTap: () {
            uploadOnTap();
          },
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [5, 5],
              strokeWidth: 1,
              color: AppColors.greyColor,
              radius: Radius.circular(8.r),
            ),
            child: Container(
              height: 80.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.cardGradientColor,
                ),
              ),
              child: Center(
                child: Column(
                  spacing: 12.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Upload Icon
                    Icon(
                      uploadPickerIcon,
                      color: AppColors.greyColor.withOpacity(0.8),
                      size: 22.h,
                    ),

                    // description
                    KText(
                      color: AppColors.greyColor.withOpacity(0.8),
                      text: description,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
