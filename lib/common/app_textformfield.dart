import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class AppTextformfield extends StatelessWidget {
  const AppTextformfield(
      {super.key,
      required this.textEditingController,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      this.isExtraValidation = false,
      this.validate,
      required this.hintText,
      this.maxLines = 1,
      this.iconVisibility = false,
      this.iconFunction,
      this.passwordVisibility = false,
      required TextInputType keyboardType,
      required List<dynamic> inputFormatters});

  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final String? Function(String)? validate;
  final bool isExtraValidation;
  final int maxLines;
  final bool iconVisibility;
  final bool passwordVisibility;
  final Function()? iconFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter a valid $hintText";
        }
        if (isExtraValidation && validate != null) {
          return validate!(value);
        }
        return null;
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        constraints: const BoxConstraints(minHeight: 45),
        isDense: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 1),
        suffixIcon: iconVisibility
            ? IconButton(
                icon: Icon(
                  passwordVisibility ? TablerIcons.eye_off : TablerIcons.eye,
                ),
                color: Colors.black,
                onPressed: iconFunction,
              )
            : null,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(47, 47, 47, 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 0, 119, 119), width: 2),
        ),
      ),
    );
  }
}
