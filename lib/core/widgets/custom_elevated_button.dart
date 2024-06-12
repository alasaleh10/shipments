import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: AppColors.kPrimariColor,
            minimumSize: Size(MediaQuery.sizeOf(context).width * .7, 50)),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyles.textStyle20bold(context)
              .copyWith(color: AppColors.kPrimari2),
        ));
  }
}
