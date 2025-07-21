import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/providers/checkbox_provider.dart';
import 'package:fuoday/commons/providers/dropdown_provider.dart';
import 'package:fuoday/config/flavors/flavors_config.dart';
import 'package:fuoday/core/constants/app_hive_storage_constants.dart';
import 'package:fuoday/core/di/injection.dart';
import 'package:fuoday/core/providers/app_file_downloader_provider.dart';
import 'package:fuoday/core/providers/app_file_picker_provider.dart';
import 'package:fuoday/core/router/app_router.dart';
import 'package:fuoday/core/service/hive_storage_service.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/providers/sliding_segmented_provider.dart';
import 'package:fuoday/features/bottom_nav/providers/bottom_nav_provider.dart';
import 'package:fuoday/features/home/presentation/provider/check_in_provider.dart';
import 'package:fuoday/features/profile/presentation/providers/profile_edit_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void commonMain() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive init
  await Hive.initFlutter();

  // Hive Open Boxes
  await Hive.openBox(AppHiveStorageConstants.authBox);
  await Hive.openBox(AppHiveStorageConstants.onBoardingBox);

  // Init HiveStorageService
  await HiveStorageService().init();

  // dependency injection
  setUpServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Bottom Nav Provider
        ChangeNotifierProvider(create: (context) => getIt<BottomNavProvider>()),

        // Sliding Segmented Provider
        ChangeNotifierProvider(
          create: (context) => getIt<SlidingSegmentedProvider>(),
        ),

        // Drop Down Provider
        ChangeNotifierProvider(create: (context) => getIt<DropdownProvider>()),

        // Check Box Provider
        ChangeNotifierProvider(create: (context) => getIt<CheckboxProvider>()),

        // Profile Edit Provider
        ChangeNotifierProvider(
          create: (context) => getIt<ProfileEditProvider>(),
        ),

        // App File Picker Provider
        ChangeNotifierProvider(
          create: (context) => getIt<AppFilePickerProvider>(),
        ),

        // Check In Provider
        ChangeNotifierProvider(create: (context) => getIt<CheckInProvider>()),

        // App File Downloader Provider
        ChangeNotifierProvider(
          create: (context) => getIt<AppFileDownloaderProvider>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppEnvironment.environmentName == "DEV"
                ? "Fuoday Dev"
                : "Fuoday",
            theme: ThemeData(
              textTheme: GoogleFonts.soraTextTheme(Theme.of(context).textTheme),
            ),
            routerConfig: appRouter,
            builder: (context, child) {
              return Banner(
                message: AppEnvironment.environmentName,
                location: BannerLocation.topEnd,
                color: AppEnvironment.environmentName == "DEV"
                    ? AppColors.checkOutColor
                    : AppColors.checkInColor,
                textStyle: TextStyle(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 1.0,
                ),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
