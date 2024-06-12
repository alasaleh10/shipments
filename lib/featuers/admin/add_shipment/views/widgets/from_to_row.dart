import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shipment/core/widgets/custom_text_form.dart';

import '../../../../../core/validation/validation_function.dart';
import '../../add_shipment_cuibt/add_shipment_cubit.dart';

class FromToRowShipment extends StatelessWidget {
  const FromToRowShipment({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<AddShipmentCubit>(context);

    return Row(
      children: [
        Expanded(
            child: CustomTextFromField(
                controller: cuibt.from,
                validator: (value) {
                  return validations(value: value!, type: '');
                },
                hintText: 'من',
                prefxIcon: FontAwesomeIcons.locationArrow)),
        Expanded(
            child: CustomTextFromField(
                controller: cuibt.to,
                validator: (value) {
                  return validations(value: value!, type: '');
                },
                hintText: 'إلى',
                prefxIcon: FontAwesomeIcons.locationDot))
      ],
    );
  }
}
