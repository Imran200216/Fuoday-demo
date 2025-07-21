import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_horizontal_spacer.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/constants/app_assets_constants.dart';
import 'package:fuoday/core/extensions/provider_extension.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/home/presentation/widgets/k_home_activities_card.dart';
import 'package:fuoday/features/home/presentation/widgets/k_home_activity_alert_dialog_box.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomeEmployeeActivities extends StatefulWidget {
  const HomeEmployeeActivities({super.key});

  @override
  State<HomeEmployeeActivities> createState() => _HomeEmployeeActivitiesState();
}

class _HomeEmployeeActivitiesState extends State<HomeEmployeeActivities> {
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
                child: Builder(
                  builder: (context) {
                    // check in provider
                    final checkInProvider = context.checkInProviderWatch;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<int>(
                          stream: checkInProvider.stopWatchTimer.rawTime,
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            KText(
                              text: "HRS",
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: AppColors.secondaryColor,
                            ),

                            KHorizontalSpacer(width: 12.w),

                            KText(
                              text: "MINS",
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: AppColors.secondaryColor,
                            ),

                            KHorizontalSpacer(width: 12.w),

                            KText(
                              text: "SEC",
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: AppColors.secondaryColor,
                            ),
                          ],
                        ),

                        KVerticalSpacer(height: 8.h),

                        KAuthFilledBtn(
                          text: checkInProvider.isCheckedIn
                              ? "Check Out"
                              : "Check In",
                          fontSize: 8.sp,
                          onPressed: () {
                            final provider = context.checkInProviderRead;
                            if (checkInProvider.isCheckedIn) {
                              provider.handleCheckOut();
                            } else {
                              provider.handleCheckIn();
                            }
                          },
                          backgroundColor: checkInProvider.isCheckedIn
                              ? AppColors.checkOutColor
                              : AppColors.checkInColor,
                          height: 25.h,
                          width: 100.w,
                        ),

                        KVerticalSpacer(height: 8.h),

                        KText(
                          text: "Status : ${checkInProvider.status}",
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: AppColors.secondaryColor,
                        ),

                        KVerticalSpacer(height: 8.h),

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
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  color: AppColors.secondaryColor,
                                ),
                                KText(
                                  text:
                                      checkInProvider.checkInTime ?? "00:00:00",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: AppColors.secondaryColor,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  color: AppColors.secondaryColor,
                                ),
                                KText(
                                  text:
                                      checkInProvider.checkOutTime ??
                                      "00:00:00",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: AppColors.secondaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
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
                  text: "Events All",
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
                  // Celebrations
                  KHomeActivitiesCard(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return KHomeActivityAlertDialogBox(
                            activityType: "Celebrations",
                            date: "12/12/2025",
                            title: "Happy Birthday Saravan 🎂",
                            subtitle:
                                "Wish you many more happy returns of the day.",
                          );
                        },
                      );
                    },
                    svgImage: AppAssetsConstants.birthdayImg,
                    cardImgBgColor: AppColors.primaryColor,
                    cardTitle: "Celebrations",
                    members: "15 members",
                    count: "12",
                    bgChipColor: AppColors.primaryColor,
                  ),

                  // Organizational Program
                  KHomeActivitiesCard(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return KHomeActivityAlertDialogBox(
                            activityType: "Organizational Program",
                            date: "12/12/2025",
                            title: "Team Meet up",
                            subtitle: "Enzopy meet up in chennai",
                          );
                        },
                      );
                    },
                    svgImage: AppAssetsConstants.organizationalProgramImg,
                    cardImgBgColor: AppColors.organizationalColor,
                    cardTitle: "Organizational Program",
                    members: "Upcoming",
                    count: "15+",
                    bgChipColor: AppColors.organizationalColor,
                  ),

                  // Announcement
                  KHomeActivitiesCard(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return KHomeActivityAlertDialogBox(
                            activityType: "Announcements",
                            date: "12/12/2025",
                            title: "New Joiners Announcements",
                            subtitle: "Enzopy meet up in chennai",
                          );
                        },
                      );
                    },
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
