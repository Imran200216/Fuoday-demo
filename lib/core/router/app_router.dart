import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/features/approval/presentation/screens/approval_screen.dart';
import 'package:fuoday/features/auth/presentation/screens/auth_forget_password_screen.dart';
import 'package:fuoday/features/auth/presentation/screens/auth_login_screen.dart';
import 'package:fuoday/features/auth/presentation/screens/auth_otp_screen.dart';
import 'package:fuoday/features/bottom_nav/presentation/employee_bottom_nav.dart';
import 'package:fuoday/features/bottom_nav/presentation/recruiter_bottom_nav.dart';
import 'package:fuoday/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:fuoday/features/feeds/presentation/screens/feeds_screen.dart';
import 'package:fuoday/features/home/presentation/screens/home_employee_screen.dart';
import 'package:fuoday/features/home/presentation/screens/home_recruiter_screen.dart';
import 'package:fuoday/features/leave_tracker/presentation/screens/leave_tracker_screen.dart';
import 'package:fuoday/features/notification/presentation/screens/notification_screen.dart';
import 'package:fuoday/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:fuoday/features/organizations/presentation/screens/organizations_screen.dart';
import 'package:fuoday/features/profile/presentation/screens/profile_screen.dart';
import 'package:fuoday/features/splash/presentation/screens/splash_screen.dart';
import 'package:fuoday/features/teams/presentation/screens/teams_screen.dart';
import 'package:fuoday/features/work/presentation/screens/work_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  // initial route
  initialLocation: "/splash",

  routes: [
    // splash screen
    GoRoute(
      path: "/splash",
      name: AppRouteConstants.splash,
      builder: (context, state) => SplashScreen(),
    ),

    // on boarding screen
    GoRoute(
      path: "/onBoarding",
      name: AppRouteConstants.onBoarding,
      builder: (context, state) => OnBoardingScreen(),
    ),

    // Auth login screen
    GoRoute(
      path: "/authLogin",
      name: AppRouteConstants.login,
      builder: (context, state) => AuthLoginScreen(),
    ),

    // Auth forget password screen
    GoRoute(
      path: "/authForgetPassword",
      name: AppRouteConstants.forgetPassword,
      builder: (context, state) {
        return AuthForgetPasswordScreen();
      },
    ),

    // Auth forget password screen
    GoRoute(
      path: "/authOTP",
      name: AppRouteConstants.otp,
      builder: (context, state) {
        return AuthOtpScreen();
      },
    ),

    // Home Employee screen
    GoRoute(
      path: "/homeEmployee",
      name: AppRouteConstants.homeEmployee,
      builder: (context, state) {
        return HomeEmployeeScreen();
      },
    ),

    // Home Employee screen
    GoRoute(
      path: "/homeRecruiter",
      name: AppRouteConstants.homeRecruiter,
      builder: (context, state) {
        return HomeRecruiterScreen();
      },
    ),

    // Profile Screen
    GoRoute(
      path: "/profile",
      name: AppRouteConstants.profile,
      builder: (context, state) {
        return ProfileScreen();
      },
    ),

    // Approval Screen
    GoRoute(
      path: "/approval",
      name: AppRouteConstants.approval,
      builder: (context, state) {
        return ApprovalScreen();
      },
    ),

    // Feeds Screen
    GoRoute(
      path: "/feeds",
      name: AppRouteConstants.feeds,
      builder: (context, state) {
        return FeedsScreen();
      },
    ),

    // Leave Tracker Screen
    GoRoute(
      path: "/leaveTracker",
      name: AppRouteConstants.leaveTracker,
      builder: (context, state) {
        return LeaveTrackerScreen();
      },
    ),

    // Notification Screen
    GoRoute(
      path: "/notification",
      name: AppRouteConstants.notification,
      builder: (context, state) {
        return NotificationScreen();
      },
    ),

    // Work Screen
    GoRoute(
      path: "/work",
      name: AppRouteConstants.work,
      builder: (context, state) {
        return WorkScreen();
      },
    ),

    // Calendar Screen
    GoRoute(
      path: "/calendar",
      name: AppRouteConstants.calendar,
      builder: (context, state) {
        return CalendarScreen();
      },
    ),

    // employee bottom nav
    GoRoute(
      path: "/employeeBottomNav",
      name: AppRouteConstants.employeeBottomNav,
      builder: (context, state) {
        return EmployeeBottomNav();
      },
    ),

    // recruiter bottom nav
    GoRoute(
      path: "/employeeBottomNav",
      name: AppRouteConstants.recruiterBottomNav,
      builder: (context, state) {
        return RecruiterBottomNav();
      },
    ),

    // Teams Screen
    GoRoute(
      path: "/teams",
      name: AppRouteConstants.teams,
      builder: (context, state) {
        return TeamsScreen();
      },
    ),

    // Organization Screen
    GoRoute(
      path: "/organizations",
      name: AppRouteConstants.organizations,
      builder: (context, state) {
        return OrganizationsScreen();
      },
    ),
  ],
);
