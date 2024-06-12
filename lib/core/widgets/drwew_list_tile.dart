import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class DrwerLitTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback onTap;
  const DrwerLitTile(
      {super.key, required this.title, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon ?? FontAwesomeIcons.plus,
        color: AppColors.kPrimari2,
        size: 25,
      ),
      title: Text(
        title,
        style: AppStyles.textStyle20bold(context)
            .copyWith(color: AppColors.kPrimari2),
      ),
    );
  }
}
