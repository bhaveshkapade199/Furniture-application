import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/Screens/Carpenter_detail/carpenter_profile.dart';
import 'package:furniture_app/common/app_buttons.dart';
import 'package:furniture_app/common/app_textformfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarpenterInfo extends StatefulWidget {
  const CarpenterInfo({super.key});

  @override
  State<CarpenterInfo> createState() => _CarpenterInfoState();
}

class _CarpenterInfoState extends State<CarpenterInfo> {
  late TextEditingController fullNameController = TextEditingController();
  late TextEditingController phone_number = TextEditingController();
  late TextEditingController address = TextEditingController();
  late TextEditingController carpenter_percentage = TextEditingController();
  late TextEditingController carpenter_team = TextEditingController();
  late TextEditingController carpenter_adhar_number = TextEditingController();
  late TextEditingController Carpenter_experience = TextEditingController();
  late TextEditingController sq_foot_rate = TextEditingController();
  late TextEditingController Email_controller = TextEditingController();

  Color borderColor = const Color.fromARGB(255, 56, 56, 56);
  bool isPhoneInput = false;
  double topPosition = 250.0;
  double bottompostion = 100;
  bool _isHoved = false;

  final List<String> items = [
    'Jalgaon,Maharashtra',
    'Pune,Maharashtra',
    'Mumbai,Maharashra',
    'Panvel,Maharashtra',
    'Dhule,Maharashtra',
    'Nashik,Maharashtra'
  ];
  String? selectedValue = 'Jalgaon,Maharashtra';
  late List<int> Expericence = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  int? selectvalue = 1;

  final List<String> rate_process = ["percentage", "sq.ft"];
  String? select_rate_process = "percentage";

  String _formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    }
    return phoneNumber;
  }

  String _adhar_number_format(String adhar_number) {
    if (adhar_number.length == 12) {
      return '${adhar_number.substring(0, 4)}-${adhar_number.substring(4, 8)}-${adhar_number.substring(6)}';
    }
    return adhar_number;
  }

  void _show_Verification_sheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 350.h,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 28.5.h),
              Container(
                height: 55.h,
                width: 55.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/verify.jpg"))),
              ),
              SizedBox(height: 34.5.h),
              const Text(
                "Your data is Successfully Saved.",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.25,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 119, 119),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("assets/images/thanks1.jpg"),
                        fit: BoxFit.cover)),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      child: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
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
                top: 170,
              ),
              child: Expanded(
                child: Container(
                  height: 800,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.5),
                        topLeft: Radius.circular(30.5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 19.5, bottom: 0, top: 24),
                    child: Container(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      width: 320.5,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 37,
                              color: Color.fromARGB(255, 0, 119, 119),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: SizedBox(
                                width: 200,
                                height: 26,
                                child: Text(
                                  "Carpenter Personal Info",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "OpenSans",
                                    color:
                                        const Color.fromARGB(255, 0, 119, 119),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24.6),
                            SizedBox(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: const SizedBox(
                                      height: 20,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Enter Carpenter full name",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "OpenSans",
                                            color:
                                                Color.fromRGBO(52, 64, 84, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  AppTextformfield(
                                    textEditingController: fullNameController,
                                    hintText: "Abc Def Xyz",
                                    keyboardType: TextInputType.text,
                                    inputFormatters: [],
                                  ),
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: const SizedBox(
                                      height: 20,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Enter Carpenter Phone number",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "OpenSans",
                                            color:
                                                Color.fromRGBO(52, 64, 84, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Container(
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color.fromARGB(
                                              255, 36, 36, 36)),
                                    ),
                                    child: MouseRegion(
                                      onEnter: (_) {
                                        setState(() {
                                          _isHoved = true;
                                        });
                                      },
                                      onExit: (_) {
                                        setState(() {
                                          _isHoved = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: TextFormField(
                                          controller: phone_number,
                                          keyboardType: TextInputType.text,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                12),
                                            PhoneNumberFormatter(),
                                          ],
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter a phone number";
                                            } else if (value
                                                    .replaceAll('-', '')
                                                    .length !=
                                                12) {
                                              return "Enter a valid 10-digit phone number";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "xxx-xxx-xxxx",
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 10,
                                                    left: 12,
                                                    bottom: 10),
                                            hintStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Color.fromRGBO(42, 42, 42, 1),
                                            ),
                                            border: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: _isHoved
                                                    ? const Color.fromARGB(
                                                        255, 46, 46, 46)
                                                    : const Color.fromARGB(
                                                        255, 0, 119, 119),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 37, 37, 37),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: const SizedBox(
                                      height: 20,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Enter Carpenter Email_id",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "OpenSans",
                                            color:
                                                Color.fromRGBO(52, 64, 84, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  AppTextformfield(
                                    textEditingController: Email_controller,
                                    hintText: "@gmai.com",
                                    keyboardType: TextInputType.text,
                                    inputFormatters: [],
                                  ),
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 2),
                                    child: const SizedBox(
                                      height: 20,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Enter Carpenter Adhar number",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "OpenSans",
                                            color:
                                                Color.fromRGBO(52, 64, 84, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Container(
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color.fromARGB(
                                              255, 36, 36, 36)),
                                    ),
                                    child: MouseRegion(
                                      onEnter: (_) {
                                        setState(() {
                                          _isHoved = true;
                                        });
                                      },
                                      onExit: (_) {
                                        setState(() {
                                          _isHoved = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: TextFormField(
                                          controller: carpenter_adhar_number,
                                          keyboardType: TextInputType.text,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                14),
                                            Adhar_number_format(),
                                          ],
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter a Adhar number";
                                            } else if (value
                                                    .replaceAll('-', '')
                                                    .length !=
                                                12) {
                                              return "Enter a valid 12-digit Adhar number";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "xxxx-xxxx-xxxx",
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 10,
                                                    left: 12,
                                                    bottom: 10),
                                            hintStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Color.fromRGBO(42, 42, 42, 1),
                                            ),
                                            border: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: _isHoved
                                                    ? const Color.fromARGB(
                                                        255, 46, 46, 46)
                                                    : const Color.fromARGB(
                                                        255, 0, 119, 119),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 37, 37, 37),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: const SizedBox(
                                      height: 20,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Enter Carpenter Address",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "OpenSans",
                                            color:
                                                Color.fromRGBO(52, 64, 84, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Container(
                                    height: 48,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: selectedValue,
                                        items: items
                                            .map((String item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color.fromARGB(
                                                              255, 37, 37, 37)),
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedValue = value;
                                          });
                                        },
                                        icon: const SizedBox.shrink(),
                                        underline: const SizedBox.shrink(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 2),
                                    child: SizedBox(
                                      height: 20,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Enter Carpenter Expericence",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "OpenSans",
                                            color:
                                                Color.fromRGBO(52, 64, 84, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Container(
                                    height: 48,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Focus(
                                        child: DropdownButton<int>(
                                          isExpanded: true,
                                          value: selectvalue,
                                          items: Expericence.map(
                                              (int experience) =>
                                                  DropdownMenuItem<int>(
                                                    value: experience,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text(
                                                        experience.toString(),
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    37,
                                                                    37,
                                                                    37)),
                                                      ),
                                                    ),
                                                  )).toList(),
                                          onChanged: (int? value) {
                                            setState(() {
                                              selectvalue = value;
                                            });
                                          },
                                          icon: const SizedBox.shrink(),
                                          underline: const SizedBox.shrink(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 2),
                                    child: SizedBox(
                                      height: 20,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Enter Carpenter rate_process",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "OpenSans",
                                            color:
                                                Color.fromRGBO(52, 64, 84, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Container(
                                    height: 48,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: select_rate_process,
                                        items: rate_process
                                            .map((String rate) =>
                                                DropdownMenuItem<String>(
                                                  value: rate,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text(
                                                      rate,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color.fromARGB(
                                                              255, 37, 37, 37)),
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            select_rate_process = value;
                                          });
                                        },
                                        icon: const SizedBox.shrink(),
                                        underline: const SizedBox.shrink(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  if (select_rate_process == "percentage") ...[
                                    const Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: SizedBox(
                                        height: 20,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Enter Carpenter Percentage",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "OpenSans",
                                              color:
                                                  Color.fromRGBO(52, 64, 84, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 9),
                                    AppTextformfield(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [],
                                      textEditingController:
                                          carpenter_percentage,
                                      hintText: "Enter percentage (%)",
                                    ),
                                  ] else if (select_rate_process ==
                                      "sq.ft") ...[
                                    const Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: SizedBox(
                                        height: 20,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Enter Carpenter sq.ft rate",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "OpenSans",
                                              color:
                                                  Color.fromRGBO(52, 64, 84, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 9),
                                    AppTextformfield(
                                      keyboardType: TextInputType.text,
                                      inputFormatters: [],
                                      textEditingController: sq_foot_rate,
                                      hintText: "Enter sq.ft rate",
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: SizedBox(
                                height: 20,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Enter Number of carpenter team",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "OpenSans",
                                      color: Color.fromRGBO(52, 64, 84, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              child: TextField(
                                controller: carpenter_team,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 12.0,
                                  ),
                                  hintText: "Team members - 00",
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(74, 74, 74, 1),
                                  ),
                                  prefixText: "Team members: ",
                                  prefixStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(74, 74, 74, 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 56, 56, 56),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 119, 119),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            AppButtons(
                                text: "Submit",
                                color: const Color.fromARGB(255, 0, 119, 119),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CarpenterProfile(
                                                Full_name:
                                                    fullNameController.text,
                                                Address: selectedValue ??
                                                    "No Address Selected",
                                                phone_number: phone_number.text,
                                                Experience: selectvalue != null
                                                    ? selectvalue.toString()
                                                    : "No Experience Selected",
                                                rateProcess: select_rate_process ??
                                                    "No Rate Process Selected",
                                                rate_percent:
                                                    carpenter_percentage.text,
                                                rate_sq_foot: sq_foot_rate.text,
                                                carpenter_team: carpenter_team
                                                        .text.isNotEmpty
                                                    ? carpenter_team.text
                                                    : "No Team Size Selected",
                                                Adhar_number:
                                                    carpenter_adhar_number.text,
                                                Email: Email_controller.text,
                                              )));
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class Adhar_number_format extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll('-', '');

    final formatted = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i == 4 || i == 8) formatted.write('-');
      formatted.write(digits[i]);
    }

    return TextEditingValue(
      text: formatted.toString(),
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll('-', '');

    final formatted = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i == 3 || i == 6) formatted.write('-');
      formatted.write(digits[i]);
    }

    return TextEditingValue(
      text: formatted.toString(),
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
