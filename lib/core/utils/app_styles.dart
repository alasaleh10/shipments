import 'package:flutter/material.dart';
import 'package:shipment/core/utils/responsive_text.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static TextStyle textStyle25Regular(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 25),
        color: const Color(0xFF1B75BB),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w400);
  }

  static TextStyle textStyle20Regular(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        color: const Color(0xFF1B75BB),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w400);
  }

  static TextStyle textStyle20bold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        color: AppColors.kPrimariColor,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold);
  }

  static TextStyle textStyle23bold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 23),
        color: AppColors.kPrimariColor,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w800);
  }
  // static TextStyle textStyle25bold(BuildContext context) {
  //   return TextStyle(
  //       fontSize: getResponsiveFontSize(context, fontSize: 23),
  //       color: AppColors.kPrimariColor,
  //       fontFamily: 'Cairo',
  //       fontWeight: FontWeight.w800);
  // }

  static TextStyle textStyle18SemiBold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        color: AppColors.kPrimariColor,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w600);
  }

  static TextStyle textStyle15SemiBold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 15),
        color: AppColors.kPrimariColor,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold);
  }

  // static TextStyle textStyle19Rqgular(BuildContext context) {
  //   return TextStyle(
  //       fontSize: getResponsiveFontSize(context, fontSize: 20),
  //       color: AppColors.kPrimariColor,
  //       fontFamily: 'Cairo',
  //       fontWeight: FontWeight.w400);
  // }
}
