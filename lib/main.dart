import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screens/log_reg_Screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furniture_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp(index: 0));
}

class MyApp extends StatelessWidget {
  final int index;
  const MyApp({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splash(
            index: 0,
          )),
    );
  }
}
