import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/features/approval/presentation/screens/approval_screen.dart';
import 'package:fuoday/features/auth/presentation/screens/auth_forget_password_screen.dart';
import 'package:fuoday/features/auth/presentation/screens/auth_login_screen.dart';
import 'package:fuoday/features/auth/presentation/screens/auth_otp_screen.dart';
import 'package:fuoday/features/feeds/presentation/screens/feeds_screen.dart';
import 'package:fuoday/features/home/presentation/screens/home_screen.dart';
import 'package:fuoday/features/leave_tracker/presentation/screens/leave_tracker_screen.dart';
import 'package:fuoday/features/notification/presentation/screens/notification_screen.dart';
import 'package:fuoday/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:fuoday/features/profile/presentation/screens/profile_screen.dart';
import 'package:fuoday/features/splash/presentation/screens/splash_screen.dart';
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

    // Home screen
    GoRoute(
      path: "/home",
      name: AppRouteConstants.home,
      builder: (context, state) {
        return HomeScreen();
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
  ],
);
