import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';

class CarpenterProfile extends StatefulWidget {
  CarpenterProfile(
      {super.key,
      required this.Full_name,
      required this.Address,
      required this.phone_number,
      required this.Experience,
      required this.carpenter_team,
      required this.Adhar_number,
      required this.rateProcess,
      required this.rate_percent,
      required this.rate_sq_foot,
      required this.Email});

  final String Full_name;
  final String Address;
  final String phone_number;
  final String Email;
  final String Adhar_number;
  final String Experience;

  final String carpenter_team;
  final String rate_percent;
  final String rate_sq_foot;
  final String rateProcess;

  @override
  State<CarpenterProfile> createState() => _CarpenterProfileState();
}

class _CarpenterProfileState extends State<CarpenterProfile> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  void _show_profile_picher(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 185,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 17.5),
                child: Text(
                  "Choose Profile photo",
                  style: TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 0, 80, 73),
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 38.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      _pickFromCamera();
                    },
                    child: const Row(
                      children: [
                        const Icon(
                          Icons.camera,
                          size: 24,
                          color: Color.fromARGB(255, 0, 119, 119),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 119, 119),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      _pickFromGallery();
                    },
                    child: const Row(
                      children: [
                        const Icon(
                          Icons.image,
                          size: 24,
                          color: Color.fromARGB(255, 0, 119, 119),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 119, 119),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  Future<void> _pickFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  String _getFirstAndLastName(String fullName) {
    List<String> nameParts = fullName.trim().split(' ');

    if (nameParts.isEmpty) {
      return '';
    } else if (nameParts.length == 1) {
      return nameParts[0];
    } else {
      return '${nameParts[0]} ${nameParts.last}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              Container(
                height: 220.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/home_page.jpg"),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                top: 150.h,
                left: 20.5.w,
                child: GestureDetector(
                  onTap: () => _show_profile_picher(context),
                  child: Container(
                    height: 130.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 4.5.w,
                        ),
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        image: _profileImage != null
                            ? DecorationImage(
                                image: FileImage(_profileImage!),
                                fit: BoxFit.cover,
                              )
                            : null),
                    child: _profileImage == null
                        ? Padding(
                            padding: EdgeInsets.only(top: 89.5.h, left: 48.5.w),
                            child: const Icon(
                              Icons.add_a_photo_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 218, 255, 246),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 237.h, left: 173.5.w),
                  child: Text(
                    _getFirstAndLastName(widget.Full_name),
                    style: const TextStyle(
                      fontSize: 21.5,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 119, 119),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 295.h),
                child: Container(
                  height: 800.h,
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.5.h),
                        Padding(
                            padding: EdgeInsets.only(left: 10.5.w),
                            child: const Text(
                              "Carpenter Name :",
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )),
                        SizedBox(height: 2.5.h),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.5, right: 15.5),
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.cyan))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.5, top: 2),
                              child: Text(
                                widget.Full_name,
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.5.h),
                        Padding(
                            padding: EdgeInsets.only(left: 10.5.w),
                            child: const Text(
                              "Carpenter Phone_number :",
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )),
                        SizedBox(height: 2.5.h),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.5, right: 10.5),
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.9, color: Colors.cyan))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.5, top: 2),
                              child: Text(
                                widget.phone_number,
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.5.h),
                        Padding(
                            padding: EdgeInsets.only(left: 10.5.w),
                            child: const Text(
                              "Carpenter Email-Id :",
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )),
                        SizedBox(height: 2.5.h),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.5, right: 10.5),
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.9, color: Colors.cyan))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.5, top: 2),
                              child: Text(
                                widget.Email,
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.5.h),
                        Padding(
                            padding: EdgeInsets.only(left: 10.5.w),
                            child: const Text(
                              "Carpenter Address :-",
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )),
                        SizedBox(height: 2.5.h),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.5, right: 10.5),
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.9, color: Colors.cyan))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.5, top: 2),
                              child: Text(
                                widget.Address,
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.5.h),
                        Padding(
                            padding: EdgeInsets.only(left: 10.5.w),
                            child: const Text(
                              "Carpenter Adhar-Number :",
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )),
                        SizedBox(height: 2.5.h),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.5, right: 10.5),
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.9, color: Colors.cyan))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.5, top: 2),
                              child: Text(
                                widget.Adhar_number,
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.5.h),
                        Padding(
                            padding: EdgeInsets.only(left: 10.5.w),
                            child: const Text(
                              "Carpenter Experience :",
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )),
                        SizedBox(height: 2.5.h),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.5, right: 10.5),
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.9, color: Colors.cyan))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.5, top: 2),
                              child: Text(
                                ("${widget.Experience} years"),
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.5.h),
                        Padding(
                            padding: EdgeInsets.only(left: 10.5.w),
                            child: const Text(
                              "Carpenter rate process :",
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )),
                        SizedBox(height: 2.5.h),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.5, right: 10.5),
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.9, color: Colors.cyan))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.5, top: 2),
                              child: Text(
                                widget.rateProcess,
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        if (widget.rateProcess == "percentage") ...[
                          SizedBox(height: 20.5.h),
                          Padding(
                              padding: EdgeInsets.only(left: 10.5.w),
                              child: const Text(
                                "Carpenter percent rate :",
                                style: TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              )),
                          SizedBox(height: 2.5.h),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.5, right: 10.5),
                            child: Container(
                              height: 30.h,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 0.9, color: Colors.cyan))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.5, top: 2),
                                child: Text(
                                  ("${widget.rate_percent} %"),
                                  style: const TextStyle(
                                      fontSize: 16.5,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ] else if (widget.rateProcess == "sq.ft") ...[
                          SizedBox(height: 20.5.h),
                          Padding(
                              padding: EdgeInsets.only(left: 10.5.w),
                              child: const Text(
                                "Carpenter sq.ft rate :",
                                style: TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              )),
                          SizedBox(height: 2.5.h),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.5, right: 10.5),
                            child: Container(
                              height: 30.h,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 0.9, color: Colors.cyan))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.5, top: 2),
                                child: Text(
                                  (" ${widget.rate_sq_foot} Rs-sq.ft"),
                                  style: const TextStyle(
                                      fontSize: 16.5,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                        SizedBox(height: 20.5.h),
                        Padding(
                            padding: EdgeInsets.only(left: 10.5.w),
                            child: const Text(
                              "Carpenter Team members :",
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )),
                        SizedBox(height: 2.5.h),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.5, right: 10.5),
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.9, color: Colors.cyan))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.5, top: 2),
                              child: Text(
                                ("${widget.carpenter_team} members"),
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.h),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
