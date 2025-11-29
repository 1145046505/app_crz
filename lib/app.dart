import 'package:flutter/material.dart';
import 'package:my_app/views/home.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: false,
      splitScreenMode: false,
      builder: (_, child) {
        return ToastificationWrapper(
          child: MaterialApp(
            title: 'CRZ App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MyHomePage(title: 'Home'),
          ),
        );
      },
    );
  }
}
