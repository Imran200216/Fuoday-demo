import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/organizations/presentation/widgets/organizations_achivements_card.dart';

class OrganizationsServiceIndustries extends StatelessWidget {
  const OrganizationsServiceIndustries({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Our Services
            KText(
              text: "Our Services",
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              textAlign: TextAlign.start,
              color: AppColors.primaryColor,
              isUnderline: true,
              underlineColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 14.h),

            // Our Services
            KText(
              text: '''
              Thikse Software Solutions offers a comprehensive range of services designed to meet the diverse needs of our clients. Our expertise spans various domains, including
            ''',
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: AppColors.titleColor,
              textAlign: TextAlign.justify,
            ),

            KVerticalSpacer(height: 14.h),

            // Custom Software Development
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.developer_mode,
              achievementDescription: "Custom Software Development",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle:
                  "Tailored solutions to meet unique business requirements.",
            ),

            KVerticalSpacer(height: 6.h),

            // IT Consulting
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.co_present,
              achievementDescription: "IT Consulting",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle:
                  "Providing strategic guidance to optimize technology investments",
            ),

            KVerticalSpacer(height: 6.h),

            // Mobile App Development
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.mobile_friendly,
              achievementDescription: "Mobile App Development",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle: "Creating seamless and intuitive mobile experiences.",
            ),

            KVerticalSpacer(height: 6.h),

            // Web Development
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.web,
              achievementDescription: "Web Development ",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle: "Creating seamless and intuitive mobile experiences.",
            ),

            KVerticalSpacer(height: 6.h),

            // Cloud Solutions
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.cloud,
              achievementDescription: "Cloud Solutions",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle: "Offering scalable and secure cloud-based services",
            ),

            KVerticalSpacer(height: 14.h),

            // Industries we serve
            KText(
              text: "Industries we serve",
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
              At Thikse Software Solutions, we pride ourselves on our ability to provide specialized solutions across a diverse range of industries. Our team of experts leverages deep industry knowledge and advanced technology to deliver innovative, high-quality solutions tailored to the unique needs of each sector. Here are some of the key industries we serve .
            ''',
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: AppColors.titleColor,
              textAlign: TextAlign.start,
            ),

            KVerticalSpacer(height: 14.h),

            // Health
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.local_hospital,
              achievementDescription: "Healthcare & Fitness",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle:
                  "Shaping the Future of Wellness. From virtual doctor visits to personalized fitness journeys, we're leading the charge towards a healthier world.",
            ),

            KVerticalSpacer(height: 6.h),

            // Banking
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.monetization_on,
              achievementDescription: "Banking & Finance",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle:
                  "Welcome to Banking & Finance website, your one-stop for banking and finance. Explore services, manage finances securely, stay updated with expert insights",
            ),

            KVerticalSpacer(height: 6.h),

            // Education
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.school,
              achievementDescription: "Education & E-Learning",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle:
                  "Revolutionizing global education with our cutting-edge software, we empower learners everywhere. From virtual classrooms to personalized experiences, we're making education limitless.",
            ),

            KVerticalSpacer(height: 6.h),

            // Food
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.food_bank_outlined,
              achievementDescription: "Food & Beverage",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle:
                  "Welcome to Food & Beverage, your premier culinary destination. Dive into flavors with AI driven menu suggestions. Revolutionize kitchen operations with efficient inventory management.",
            ),

            KVerticalSpacer(height: 6.h),

            // Entertainment
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.speaker,
              achievementDescription: "Entertainment",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle:
                  "Immerse in immersive VR adventures and boundary-breaking gaming. For film buffs and gamers alike, our inclusive platform revolutionizes entertainment. ",
            ),

            KVerticalSpacer(height: 6.h),

            // Cloud Solutions
            OrganizationsAchievementsValueCard(
              leadingIconData: Icons.shopping_bag,
              achievementDescription: "Retail & E-commerce",
              leadingIconColor: AppColors.primaryColor,
              isSubTitle: true,
              subTitle:
                  "Empower digital commerce with our advanced e-commerce solutions, enhancing user experience and driving conversions. Partner with us to bring your digital vision to life and boost sales.",
            ),
          ],
        ),
      ),
    );
  }
}
