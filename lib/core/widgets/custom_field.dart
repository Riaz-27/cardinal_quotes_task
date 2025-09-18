import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isObscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextTheme.of(
              context,
            ).bodyMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
        suffixIcon: suffixIcon,
        suffixIconColor: AppPalette.color3,
      ),
      style: TextTheme.of(context).bodyMedium!.copyWith(fontSize: 14),
      obscureText: isObscureText,
      validator: (val) {
        if (val!.trim().isEmpty) {
          return '$hintText is missing';
        }
        return null;
      },
    );
  }
}
