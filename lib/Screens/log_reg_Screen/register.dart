import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/log_reg_Screen/onboarding.dart';

import 'package:furniture_app/common/app_buttons.dart';

class Register extends StatefulWidget {
  final TabController? tabController;
  const Register({super.key, this.tabController});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailOrPhoneController1 = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = true;
  bool isFullNameEmpty = true;
  bool isEmailEmpty = true;

  @override
  void initState() {
    super.initState();

    fullNameController.addListener(() {
      setState(() {
        isFullNameEmpty = fullNameController.text.isEmpty;
      });
    });

    emailOrPhoneController1.addListener(() {
      setState(() {
        isEmailEmpty = emailOrPhoneController1.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailOrPhoneController1.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18.5.h),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: const Text(
              "Enter your full name",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Open Sans",
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
                hintText: "Abc Xyz Mmf",
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(170, 170, 170, 1),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                prefixIcon: isFullNameEmpty
                    ? const Icon(
                        Icons.person,
                        size: 20,
                      )
                    : null,
                prefixIconColor: const Color.fromARGB(255, 0, 119, 119),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 119, 119),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: const Text(
              "Email or phone number",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Open Sans",
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: TextField(
              controller: emailOrPhoneController1,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 11.0,
                  horizontal: 12.0,
                ),
                hintText: "@email.com",
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(170, 170, 170, 1),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                prefixIcon: isEmailEmpty
                    ? const Icon(
                        Icons.email,
                        size: 20,
                      )
                    : null,
                prefixIconColor: const Color.fromARGB(255, 0, 119, 119),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 119, 119),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: const Text(
              "Enter the password here",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Open Sans",
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 25.h, right: 25.h),
            child: TextFormField(
              controller: passwordController,
              obscureText: passwordVisibility,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 11.0,
                  horizontal: 12.0,
                ),
                hintText: "******",
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(170, 170, 170, 1),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 119, 119),
                    width: 2,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisibility
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                    });
                  },
                ),
              ),
              validator: (password) {
                if (password == null || password.isEmpty) {
                  return "Password is required";
                }
                if (password.length < 6) {
                  return "Enter at least 6 digit password";
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 28.5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: AppButtons(
                text: "Register here",
                color: const Color.fromARGB(255, 0, 119, 119),
                onPressed: () {}),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const OnboardingTabs(index: 0)));
                },
                child: const Center(
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 0, 119, 119),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
