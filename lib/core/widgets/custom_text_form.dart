import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextFromField extends StatelessWidget {
  final void Function(String)? onChanged;
  final bool? enable;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String hintText;
  final int? maxlines;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final IconData prefxIcon;
  final bool? isPassword;
  const CustomTextFromField(
      {super.key,
      this.onChanged,
      this.controller,
      this.obscureText = false,
      required this.hintText,
      required this.prefxIcon,
      this.isPassword,
      this.suffixIcon,
      this.validator,
      this.maxlines,
      this.textInputType,
      this.enable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextFormField(
        enabled: enable,
        keyboardType: textInputType,
        maxLines: maxlines ?? 1,
        controller: controller,
        validator: validator,
        style: AppStyles.textStyle20bold(context),
        cursorColor: AppColors.kPrimariColor,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
            labelStyle: AppStyles.textStyle20bold(context),
            errorStyle: AppStyles.textStyle15SemiBold(context)
                .copyWith(color: Colors.red),
            hintText: hintText,
            hintStyle: AppStyles.textStyle20bold(context),
            labelText: hintText,
            prefixIcon: Icon(prefxIcon, color: AppColors.kPrimariColor),
            suffixIcon: isPassword == true ? suffixIcon : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            border: customTextFiledBorder(),
            errorBorder: customTextFiledBorder(isError: true),
            focusedErrorBorder: customTextFiledBorder(),
            focusedBorder: customTextFiledBorder(),
            disabledBorder: customTextFiledBorder(),
            enabledBorder: customTextFiledBorder()),
      ),
    );
  }
}

OutlineInputBorder customTextFiledBorder({bool isError = false}) {
  return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide:
          BorderSide(color: isError ? Colors.red : AppColors.kPrimariColor));
}
