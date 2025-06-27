import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/onboarding.dart';

import 'package:otp_text_field_v2/otp_text_field_v2.dart';
import 'package:furniture_app/common/app_buttons.dart';

import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OtpScreen> {
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  String enteredOtp = "";
  bool isOtpFieldActive = false;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 406,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SizedBox(
              height: 400,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage("assets/images/verify.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Verification Success",
                      style: TextStyle(
                        fontSize: 21,
                        color: Color(0xff101828),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "Your Password is",
                        style: TextStyle(
                          fontSize: 15,
                          wordSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.4,
                          color: Color(0xff475467),
                        ),
                        children: [
                          TextSpan(
                            text: " Successfully changed, you can now",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff475467),
                            ),
                          ),
                          TextSpan(
                            text: ", log in your account.",
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 0.4,
                              wordSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff475467),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "Thank You !",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 0, 119, 119),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppButtons(
                      text: "Ok",
                      fontSize: 18,
                      color: const Color.fromARGB(255, 0, 119, 119),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpScreen()));
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: -60,
                  child: SizedBox(
                    height: 386.09,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/home_page.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 267,
                  ),
                  child: Container(
                    height: 533,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(28.5),
                          topLeft: Radius.circular(28.5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 19.5, bottom: 135, top: 1),
                      child: Container(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        height: 400,
                        width: 320.5,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 124,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 56,
                                    width: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Color.fromARGB(255, 235, 255, 255),
                                    ),
                                    child: Container(
                                      height: 26,
                                      width: 26,
                                      padding: const EdgeInsets.all(
                                        8,
                                      ),
                                      child: const Icon(
                                        TablerIcons.password_user,
                                        size: 34,
                                        color: Color.fromARGB(255, 0, 119, 119),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 177,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: SizedBox(
                                      height: 30,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "My code is ",
                                          style: TextStyle(
                                            fontSize: 17.6,
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 0, 119, 119),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16.5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: OTPTextFieldV2(
                                      controller: otpController,
                                      length: 6,
                                      autoFocus: true,
                                      width: MediaQuery.of(context).size.width,
                                      textFieldAlignment:
                                          MainAxisAlignment.spaceAround,
                                      fieldWidth: 45,
                                      fieldStyle: FieldStyle.underline,
                                      outlineBorderRadius: 15,
                                      style: const TextStyle(fontSize: 17),
                                      onChanged: (pin) {
                                        setState(() {
                                          enteredOtp = pin;
                                          isOtpFieldActive = true;
                                        });
                                      },
                                      onCompleted: (pin) {
                                        setState(() {
                                          enteredOtp = pin;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 34.5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.6, right: 8.6),
                                    child: AppButtons(
                                      text: "Verify",
                                      color: const Color.fromARGB(
                                          255, 0, 119, 119),
                                      onPressed: () {
                                        if (enteredOtp.length == 6) {
                                          _showBottomSheet(context);
                                        } else if (isOtpFieldActive) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "Please fill all OTP fields."),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 7, right: 7),
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 121, 121, 121))),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const OnboardingTabs(
                                                    index: 0)));
                                  },
                                  child: const Center(
                                    child: Text(
                                      "log in",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromARGB(255, 0, 119, 119),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
