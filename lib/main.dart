import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/providers/checkbox_provider.dart';
import 'package:fuoday/commons/providers/dropdown_provider.dart';
import 'package:fuoday/core/di/injection.dart';
import 'package:fuoday/core/router/app_router.dart';
import 'package:fuoday/features/auth/presentation/providers/sliding_segmented_provider.dart';
import 'package:fuoday/features/bottom_nav/providers/bottom_nav_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  // dependency injection
  configureDependencies();

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
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Fuoday',
            theme: ThemeData(
              textTheme: GoogleFonts.soraTextTheme(Theme.of(context).textTheme),
            ),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
