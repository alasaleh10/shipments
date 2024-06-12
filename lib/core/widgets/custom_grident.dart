import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/app_colors.dart';

LinearGradient customGradient() {
  return LinearGradient(
      transform: const GradientRotation(0.2),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // stops: [
      //   0.0,
      //   2.0,
      // ],
      colors: [
        AppColors.kPrimariColor,
        AppColors.kPrimari2.withOpacity(.4),

        // AppColors.kPrimaryColor
      ]);
}
