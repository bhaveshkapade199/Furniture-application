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
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return const HomeScreen();
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Builder(
              builder: (ctx) {
                Future.delayed(Duration.zero, () {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(
                      content: Text('Please check your network connection'),
                    ),
                  );
                });
                return const Center(child: Text("Something went wrong"));
              },
            ),
          );
        }

        // If user is not logged in
        return const OnboardingTabs(index: 0);
      },
    );
  }
}
