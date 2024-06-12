import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/featuers/admin/edit_shipment/view_model/edit_shipment_cuibt/edit_shipment_cubit.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_text_form.dart';

class ShipmentStatusDropButton extends StatefulWidget {
  final int? stats;

  const ShipmentStatusDropButton({super.key, this.stats});

  @override
  State<ShipmentStatusDropButton> createState() =>
      _ShipmentStatusDropButtonState();
}

class _ShipmentStatusDropButtonState extends State<ShipmentStatusDropButton> {
  int? statu;
  void chooseStatsu(int statu) {
    this.statu = statu;
    BlocProvider.of<EditShipmentCubit>(context).status=statu;
  }

  List status = [
    {'title': 'لم تتحرك بعد', 'status': 0},
    {'title': 'في الطـريق', 'status': 1},
    {'title': 'تم التوصيل ', 'status': 2}
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      child: DropdownButtonFormField(
        value:widget.stats ,
          padding: EdgeInsets.zero,
          decoration: InputDecoration(
            enabledBorder: customTextFiledBorder(),
            border: customTextFiledBorder(),
          ),
          items: [
            ...List.generate(
                status.length,
                (index) => DropdownMenuItem(
                      value: status[index]['status'],
                      child: Text(
                        status[index]['title'],
                        style: AppStyles.textStyle18SemiBold(context),
                      ),
                    ))
          ],
          onChanged: (val) {
            chooseStatsu(int.parse(val.toString()));
          }),
    );
  }
}
