import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/constants/app_assets_constants.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/home/presentation/widgets/k_home_activities_card.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomeEmployeeActivities extends StatefulWidget {
  const HomeEmployeeActivities({super.key});

  @override
  State<HomeEmployeeActivities> createState() => _HomeEmployeeActivitiesState();
}

class _HomeEmployeeActivitiesState extends State<HomeEmployeeActivities> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            KVerticalSpacer(height: 20.h),

            // Welcome Text
            KText(
              text: "Welcome, John!",
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: AppColors.titleColor,
            ),

            KVerticalSpacer(height: 10.h),

            KText(
              text:
                  "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work.",
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
              color: AppColors.titleColor,
            ),

            KVerticalSpacer(height: 20.h),

            // Timer
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                width: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display timer with hours, minutes, and seconds only
                    StreamBuilder<int>(
                      stream: _stopWatchTimer.rawTime,
                      initialData: 0,
                      builder: (context, snapshot) {
                        final value = snapshot.data!;
                        final displayTime = StopWatchTimer.getDisplayTime(
                          value,
                          hours: true,
                          minute: true,
                          second: true,
                          milliSecond: false,
                        );
                        return KText(
                          text: displayTime,
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                          color: AppColors.secondaryColor,
                        );
                      },
                    ),

                    // Hrs / Mins / Sec
                    Row(
                      spacing: 12.w,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Hrs
                        KText(
                          text: "HRS",
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: AppColors.secondaryColor,
                        ),

                        // Mins
                        KText(
                          text: "MINS",
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: AppColors.secondaryColor,
                        ),

                        // Sec
                        KText(
                          text: "SEC",
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: AppColors.secondaryColor,
                        ),
                      ],
                    ),

                    KVerticalSpacer(height: 8.h),

                    // Check In Color
                    KAuthFilledBtn(
                      text: "Check In",
                      fontSize: 8.sp,
                      onPressed: () {},
                      backgroundColor: AppColors.checkInColor,
                      height: 25.h,
                      width: 100.w,
                    ),

                    KVerticalSpacer(height: 8.h),

                    // Status Checked In
                    KText(
                      text: "Status : Not Checked in",
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: AppColors.secondaryColor,
                    ),

                    KVerticalSpacer(height: 8.h),

                    // Location
                    KAuthFilledBtn(
                      text: "Location onSite",
                      fontSize: 8.sp,
                      onPressed: () {},
                      backgroundColor: AppColors.locationOnSiteColor,
                      height: 25.h,
                      width: 100.w,
                    ),

                    KVerticalSpacer(height: 10.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          spacing: 4.h,
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: AppColors.secondaryColor,
                            ),

                            // Login in
                            KText(
                              text: "9:10 AM",
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: AppColors.secondaryColor,
                            ),
                          ],
                        ),

                        Column(
                          spacing: 4.h,
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: AppColors.secondaryColor,
                            ),

                            // Login in
                            KText(
                              text: "9:10 AM",
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: AppColors.secondaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            KVerticalSpacer(height: 20.h),
            Row(
              spacing: 8.w,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                KText(
                  text: "Events",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: AppColors.titleColor,
                ),
                Icon(Icons.event, color: AppColors.titleColor),
              ],
            ),
            KVerticalSpacer(height: 10.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 12.w,
                children: [
                  KHomeActivitiesCard(
                    svgImage: AppAssetsConstants.birthdayImg,
                    cardImgBgColor: AppColors.primaryColor,
                    cardTitle: "Celebrations",
                    members: "15 members",
                    count: "15+",
                    bgChipColor: AppColors.primaryColor,
                  ),
                  KHomeActivitiesCard(
                    svgImage: AppAssetsConstants.organizationalProgramImg,
                    cardImgBgColor: AppColors.organizationalColor,
                    cardTitle: "Organizational Program",
                    members: "Upcoming",
                    count: "15+",
                    bgChipColor: AppColors.organizationalColor,
                  ),
                  KHomeActivitiesCard(
                    svgImage: AppAssetsConstants.announcementsImg,
                    cardImgBgColor: AppColors.announcementColor,
                    cardTitle: "Announcement",
                    members: "Upcoming",
                    count: "15+",
                    bgChipColor: AppColors.announcementColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
