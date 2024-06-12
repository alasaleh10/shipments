import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/core/utils/app_colors.dart';
import 'package:shipment/core/utils/app_styles.dart';
import 'package:shipment/featuers/admin/add_shipment/add_shipment_cuibt/add_shipment_cubit.dart';
import 'package:shipment/featuers/admin/add_shipment/data/add_shipment_repo_im.dart';

import 'widgets/add_shipment_body_view.dart';

class AddShipmentView extends StatelessWidget {
  const AddShipmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddShipmentCubit(AddShipmentRepoIm()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إضافة شحنة',
            style: AppStyles.textStyle25Regular(context)
                .copyWith(color: AppColors.kPrimari2),
          ),
        ),
        body: const AddShipmentBodyView(),
      ),
    );
  }
}
