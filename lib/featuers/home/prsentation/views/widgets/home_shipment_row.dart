import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shipment/core/utils/app_styles.dart';

class HomeShipmentRow extends StatelessWidget {
  final String title, subTitle;
  const HomeShipmentRow(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppStyles.textStyle23bold(context),
      child: Row(
        children: [Text('$title : '), Expanded(child: Text(subTitle))],
      ),
    );
  }
}
