import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quize_int/Controllers/database_helper.dart';
import 'package:quize_int/Controllers/student_provider.dart';
import 'package:quize_int/Models/students.dart';
import 'package:quize_int/widgets/text_form_field.dart';

import 'Screens/signup_screen.dart';
import 'constants.dart';
import 'Screens/login_screen.dart';

void main() {
  runApp(
    ProviderScope(

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: themeData,
          home: child,
        );
      },
      child: MyHomePage(),
    );
  }
}


