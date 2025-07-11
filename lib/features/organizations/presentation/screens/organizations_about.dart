import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/organizations/presentation/widgets/organizations_achivements_card.dart';
import 'package:fuoday/features/organizations/presentation/widgets/organizations_image_carousel.dart';

class OrganizationsAbout extends StatelessWidget {
  const OrganizationsAbout({super.key});

  @override
  Widget build(BuildContext context) {
    // Company Urls
    List<String> companyUrls = [
      "https://static.vecteezy.com/system/resources/previews/014/018/563/non_2x/amazon-logo-on-transparent-background-free-vector.jpg",
      "https://logos-world.net/wp-content/uploads/2020/11/Flipkart-Logo-2015-present.jpg",
      "https://media.designrush.com/inspiration_images/757008/conversions/JPMorgan-Chase-Logo-SVG-desktop.jpg",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // About us
            KText(
              text: "About Us",
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              textAlign: TextAlign.start,
              color: AppColors.primaryColor,
              isUnderline: true,
              underlineColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 14.h),

            // Thikse Description
            KText(
              text: '''
            At Thikse Software Solutions, we're on a mission to empower talent and exceed client expectations. Our approach combines fresh perspectives with a dedication to securing exciting projects, creating a dynamic community where innovation flourishes and success is inevitable.  Since our inception, we have been committed to delivering cutting-edge software solutions that help businesses thrive in an ever-evolving digital landscape.
            ''',
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: AppColors.titleColor,
              textAlign: TextAlign.justify,
            ),

            KVerticalSpacer(height: 14.h),

            // Achievements
            KText(
              text: "Achievements",
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              textAlign: TextAlign.start,
              color: AppColors.primaryColor,
              isUnderline: true,
              underlineColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 10.h),

            // Achievements
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.celebration,
              achievementDescription:
                  "Successfully completing over 500 projects across various industries.",
              leadingIconColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 6.h),

            // Achievements
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.lightbulb,
              achievementDescription:
                  "Establishing partnerships with leading technology providers.",
              leadingIconColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 6.h),

            // Achievements
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.group,
              achievementDescription:
                  "Building long-term relationships with clients who trust us as their technology partner",
              leadingIconColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 14.h),

            // Our Values
            KText(
              text: "Our Values",
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              textAlign: TextAlign.start,
              color: AppColors.primaryColor,
              isUnderline: true,
              underlineColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 10.h),

            // Achievements
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.lightbulb,
              achievementDescription: "Innovations",
              leadingIconColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 6.h),

            // Achievements
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.check_circle,
              achievementDescription: "Quality",
              leadingIconColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 6.h),

            // Achievements
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.person,
              achievementDescription: "Collaborations",
              leadingIconColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 14.h),

            // Clients
            KText(
              text: "Our Clients",
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              textAlign: TextAlign.start,
              color: AppColors.primaryColor,
              isUnderline: true,
              underlineColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 14.h),

            KText(
              text: '''
              At Thikse Software Solutions, we are proud to collaborate with a diverse range of clients who trust us to deliver innovative and effective solutions. Our client base spans various industries, each with unique challenges and requirements.
            ''',
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: AppColors.titleColor,
              textAlign: TextAlign.justify,
            ),

            KVerticalSpacer(height: 14.h),

            // Carousel companies
            OrganizationsImageCarousel(imageUrls: companyUrls),

            KVerticalSpacer(height: 10.h),
          ],
        ),
      ),
    );
  }
}
