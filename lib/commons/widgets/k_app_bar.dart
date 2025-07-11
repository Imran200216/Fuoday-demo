import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final IconData leadingIcon;
  final List<Widget>? actionsWidgets;
  final VoidCallback onLeadingIconPress;

  const KAppBar({
    super.key,
    required this.title,
    required this.centerTitle,
    required this.leadingIcon,
    this.actionsWidgets,
    required this.onLeadingIconPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      centerTitle: centerTitle,
      title: Text(title),
      titleTextStyle: GoogleFonts.sora(
        color: AppColors.secondaryColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
      leading: IconButton(
        onPressed: () {
          onLeadingIconPress();

          HapticFeedback.mediumImpact();
        },
        icon: Icon(leadingIcon, color: AppColors.secondaryColor),
      ),
      actions: actionsWidgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
