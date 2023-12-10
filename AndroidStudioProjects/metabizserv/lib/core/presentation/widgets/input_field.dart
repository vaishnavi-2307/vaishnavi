import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final double width;
  final Color? backgroundColor;
  final String? hintText;
  final IconData? icon;
  final String? title;
  final int? maxLines;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function()? onComplete;
  final AutovalidateMode? autovalidateMode;
  const InputField({
    Key? key,
    this.width = 216,
    this.backgroundColor,
    this.hintText,
    this.icon,
    this.title,
    this.maxLines,
    this.focusNode,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.obscureText = false,
    this.onComplete,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onComplete,
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      cursorHeight: 16,
      maxLines: maxLines,
      cursorColor: Colors.grey,
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: suffixIcon,
        labelText: hintText,
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}
