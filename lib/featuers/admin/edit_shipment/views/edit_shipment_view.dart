import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/core/utils/app_colors.dart';
import 'package:shipment/core/utils/app_styles.dart';
import 'package:shipment/featuers/admin/edit_shipment/data/shipment_admin_repi_im.dart';
import 'package:shipment/featuers/admin/edit_shipment/view_model/edit_shipment_cuibt/edit_shipment_cubit.dart';

import 'widgets/edite_shipment_body_view.dart';

class EditShipmentView extends StatelessWidget {
  const EditShipmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditShipmentCubit(ShipmentAdminRepoIm()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'تعديل شحنة',
            style: AppStyles.textStyle25Regular(context)
                .copyWith(color: AppColors.kPrimari2),
          ),
        ),
        body: const EditShimpmentBodyView(),
      ),
    );
  }
}
