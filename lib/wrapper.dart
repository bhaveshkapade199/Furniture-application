import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_app/Screens/home_screen/home_screen.dart';
import 'package:furniture_app/Screens/log_reg_Screen/onboarding.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return OnboardingTabs(index: 0);
        }
      },
    );
  }
}
