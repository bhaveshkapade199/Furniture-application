import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:furniture_app/Screens/log_reg_Screen/onboarding.dart';

import 'package:furniture_app/common/app_buttons.dart';

import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'package:furniture_app/common/app_textformfield.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final TabController? tabController;
  const ForgetPasswordScreen({super.key, this.tabController});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController phone_number_controller = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  Color borderColor = const Color.fromARGB(255, 56, 56, 56);
  bool isPhoneInput = false;
  double topPosition = 250.0;
  double bottompostion = 100;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        borderColor = _focusNode.hasFocus
            ? const Color.fromARGB(255, 52, 167, 255)
            : const Color.fromARGB(255, 56, 56, 56);
      });
    });

    emailOrPhoneController.addListener(() {
      final input = emailOrPhoneController.text.trim();
      final phoneRegex = RegExp(r'^\d+$'); // Only digits

      setState(() {
        isPhoneInput = phoneRegex.hasMatch(input);
      });
    });
  }

  String? _validateInput(String value) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    final phoneRegex = RegExp(r'^\d{10}$');

    if (value.isEmpty) {
      return "Please enter an email or phone number.";
    }

    if (phoneRegex.hasMatch(value)) {
      setState(() {
        borderColor = const Color.fromRGBO(86, 217, 117, 1); // Green border
      });
      return null; // Valid phone number
    } else if (emailRegex.hasMatch(value)) {
      setState(() {
        borderColor = const Color.fromRGBO(86, 217, 117, 1); // Green border
      });
      return null; // Valid email
    } else {
      setState(() {
        borderColor = Colors.red; // Invalid input
      });
      return "Enter a valid email or 10-digit phone number.";
    }
  }

  void _showBottomSheet(String userInput) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final double screenHeight = MediaQuery.of(context).size.height;
        final double screenWidth = MediaQuery.of(context).size.width;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: screenHeight * 4,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 2,
                    width: 32,
                    color: const Color(0xffD0D5DD),
                  ),
                  SizedBox(height: screenHeight * 0.07),
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 7,
                          color: const Color(0xffD1FADF),
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                      child: Icon(
                        TablerIcons.checkbox,
                        size: 48,
                        color: Color(0xff039855),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Text(
                    "Verification sent",
                    style: TextStyle(
                      fontSize: 21,
                      color: Color(0xff101828),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "We sent a code to ",
                          style: const TextStyle(
                            fontSize: 15,
                            wordSpacing: 0.5,
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff475467),
                          ),
                          children: [
                            TextSpan(
                              text: userInput,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff475467),
                              ),
                            ),
                            const TextSpan(
                              text: ", enter it here to log in.",
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 0.4,
                                wordSpacing: 0.5,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff475467),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  SizedBox(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.9,
                    child: AppButtons(
                      text: "Okay",
                      fontSize: 16,
                      onPressed: () {},
                      color: const Color.fromARGB(255, 0, 119, 119),
                      textColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Text(
                        "Resend code",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 119, 119)),
                      ),
                    ),
                  ),
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
    return Scaffold(
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
                top: 260,
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
                      left: 20, right: 19.5, bottom: 135, top: 18),
                  child: Container(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    height: 374,
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
                                  color: const Color.fromRGBO(245, 246, 255, 1),
                                ),
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  padding: const EdgeInsets.all(
                                    8,
                                  ),
                                  child: const Icon(
                                    TablerIcons.lock,
                                    size: 24,
                                    color: Color.fromARGB(255, 0, 119, 119),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const SizedBox(
                                height: 32,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 3,
                                      bottom: 3,
                                      left: 64.25,
                                      right: 60.25),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                      width: 200,
                                      height: 26,
                                      child: Text(
                                        "Forgotten password",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "OpenSans",
                                          color: const Color.fromARGB(
                                              255, 0, 119, 119),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          height: 156,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 2),
                                child: SizedBox(
                                  height: 20,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Enter email or number",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "OpenSans",
                                        color: Color.fromRGBO(52, 64, 84, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              AppTextformfield(
                                textEditingController: phone_number_controller,
                                keyboardType: isPhoneInput
                                    ? TextInputType.number
                                    : TextInputType.emailAddress,
                                inputFormatters: isPhoneInput
                                    ? [LengthLimitingTextInputFormatter(10)]
                                    : [],
                                hintText: "Email or phone number",
                              ),
                              const SizedBox(height: 28),
                              AppButtons(
                                  text: "Verify",
                                  color: const Color.fromARGB(255, 0, 119, 119),
                                  onPressed: () {})
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        SizedBox(
                          height: 40,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OnboardingTabs(index: 0)));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    TablerIcons.arrow_narrow_left,
                                    color: Color.fromARGB(255, 0, 119, 119),
                                    size: 24,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: Text(' Back to log in',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 119, 119),
                                        fontSize: 14,
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ],
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
    ));
  }
}
