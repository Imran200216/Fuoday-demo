import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/core/router/app_router.dart';
import 'package:fuoday/features/bottom_nav/providers/bottom_nav_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Bottom Nav Provider
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Fuoday',
            theme: ThemeData(),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
