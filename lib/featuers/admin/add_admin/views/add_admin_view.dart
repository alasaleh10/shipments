import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/core/utils/app_colors.dart';
import 'package:shipment/core/utils/app_styles.dart';
import 'package:shipment/featuers/admin/add_admin/add_admin_cuibt/add_admin_cubit.dart';
import 'package:shipment/featuers/admin/add_admin/repo.dart';

import 'add_admin_body_view.dart';

class AddAdminView extends StatelessWidget {
  const AddAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAdminCubit(AddAdminRepoIm()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إضافة أدمن',
            style: AppStyles.textStyle25Regular(context)
                .copyWith(color: AppColors.kPrimari2),
          ),
        ),
        body: const AddAdminBodyView(),
      ),
    );
  }
}
