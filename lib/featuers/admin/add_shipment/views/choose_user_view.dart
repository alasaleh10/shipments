import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/core/utils/app_colors.dart';
import 'package:shipment/core/utils/app_styles.dart';
import 'package:shipment/featuers/admin/add_shipment/choose_users_cuibt/choose_users_cubit.dart';
import 'package:shipment/featuers/admin/add_shipment/data/add_shipment_repo_im.dart';

import 'widgets/choose_user_body_view.dart';

class ChooseUserView extends StatelessWidget {
  final BuildContext context2;
  const ChooseUserView({super.key, required this.context2});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChooseUsersCubit(AddShipmentRepoIm()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إختيار عميل',
            style: AppStyles.textStyle25Regular(context)
                .copyWith(color: AppColors.kPrimari2),
          ),
        ),
        body: ChooseUserBodyView(
          context2: context2,
        ),
      ),
    );
  }
}
