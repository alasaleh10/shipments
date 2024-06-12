import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

SnackBar customSnackBar(BuildContext context, {required String errorMessage}) {
  return SnackBar(
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.fixed,
      padding: const EdgeInsets.symmetric(vertical: 20),
      backgroundColor: AppColors.kPrimariColor,
      content: Center(
          child: FittedBox(
        child: Text(
          errorMessage,
          style: AppStyles.textStyle20bold(context)
              .copyWith(color: AppColors.kPrimari2),
        ),
      )));
}
