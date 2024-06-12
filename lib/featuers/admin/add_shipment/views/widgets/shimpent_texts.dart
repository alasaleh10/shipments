import 'package:flutter/material.dart';
import 'package:shipment/core/utils/app_colors.dart';
import 'package:shipment/core/utils/app_styles.dart';

class ShipmentTexts extends StatelessWidget {
  final String title;
  const ShipmentTexts({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Text(
          title,
          style: AppStyles.textStyle23bold(context),
          textAlign: TextAlign.center,
        ),
        const Divider(
          color: AppColors.kPrimariColor,
          endIndent: 50,
          indent: 50,
        )
      ],
    );
  }
}
