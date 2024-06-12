import 'package:flutter/material.dart';
import 'package:shipment/core/widgets/custom_snac_bar.dart';

dispalySnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(customSnackBar(context, errorMessage: message));
}
