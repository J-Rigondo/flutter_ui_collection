import 'package:flutter/material.dart';
import 'package:online_course_ui/screens/root_app.dart';
import 'package:online_course_ui/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.appBgColor,
        primaryColor: AppColor.primary,
        appBarTheme: AppBarTheme(
            backgroundColor: AppColor.appBgColor,
            foregroundColor: Colors.black,
            centerTitle: true),
      ),
      home: const RootApp(),
    );
  }
}
