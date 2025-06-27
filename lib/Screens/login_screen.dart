import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/Carpenter_detail/carpenter_info.dart';
import 'package:furniture_app/Screens/forget_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screens/home_screen/home_screen.dart';
import 'package:furniture_app/common/app_buttons.dart';
import 'package:furniture_app/common/app_textformfield.dart';

class LoginScreen extends StatefulWidget {
  final TabController tabController;
  final String? prefilledData;
  const LoginScreen(
      {super.key, required this.tabController, this.prefilledData});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = true;
  bool showRedBox = false;

  @override
  void initState() {
    super.initState();
    if (widget.prefilledData != null) {
      emailController.text = widget.prefilledData!;
    }
    emailController.addListener(_handleInputChange);
  }

  void _handleInputChange() {
    final input = emailController.text.trim();
    if (RegExp(r'^\d{1,}$').hasMatch(input)) {
      if (!showRedBox) {
        setState(() {
          showRedBox = true;
        });
      }
    } else {
      if (showRedBox) {
        setState(() {
          showRedBox = false;
        });
      }
    }
  }

  void _switchToRegistrationTab() {
    if (widget.tabController.index != 1) {
      widget.tabController.animateTo(1);
    }
  }

  @override
  void dispose() {
    emailController.removeListener(_handleInputChange);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.w, right: 25.w, bottom: 10.h, top: 25.5.h),
      child: SingleChildScrollView(
        child: Column(
          key: const ValueKey('login-form'),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email or phone number",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Open Sans",
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            AppTextformfield(
              textEditingController: emailController,
              keyboardType: TextInputType.text,
              inputFormatters: [],
              hintText: "Email or phone number",
              isExtraValidation: true,
              validate: (email) {
                if (email.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(email)) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            const Text(
              " Password",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Open Sans",
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            AppTextformfield(
              keyboardType: TextInputType.text,
              inputFormatters: [],
              textEditingController: passwordController,
              hintText: " Password",
              obscureText: passwordVisibility,
              isExtraValidation: true,
              validate: (password) {
                if (password.length < 6) {
                  return "Enter at least 6 digit password";
                }
                return null;
              },
              iconFunction: () {
                debugPrint(passwordVisibility.toString());
                setState(() {
                  passwordVisibility = !passwordVisibility;
                });
              },
              iconVisibility: true,
              passwordVisibility: passwordVisibility,
            ),
            SizedBox(
              height: 9.h,
            ),
            Container(
              height: 19,
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen()));
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.5.h,
            ),
            AppButtons(
                text: "Log in",
                color: const Color.fromARGB(255, 0, 119, 119),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
            SizedBox(
              height: 20.5.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1, right: 1),
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CarpenterInfo()));
                  },
                  child: const Center(
                    child: Text(
                      "Join us",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 0, 119, 119),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Center(child: Text("Don't have an account yet?")),
            SizedBox(height: 25.h)
          ],
        ),
      ),
    );
  }
}
