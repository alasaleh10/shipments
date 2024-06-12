import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shipment/core/functions/is_admin.dart';
import 'package:shipment/core/utils/app_colors.dart';
import 'package:shipment/core/utils/app_styles.dart';
import 'package:shipment/featuers/admin/admin_drwer.dart';
import 'package:shipment/featuers/home/data/home_repo.dart';
import 'package:shipment/featuers/home/prsentation/view_model/cubit/home_cubit.dart';
import 'package:shipment/featuers/home/prsentation/views/widgets/home_body_view.dart';

import '../../../../core/routers/app_routers.dart';
import '../../../../helper/cached_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoIm()),
      child: Scaffold(
        appBar: AppBar(
          actions: isAdmin()
              ? null
              : [
                  IconButton(
                      onPressed: () {
                        CacheHelper.sharedPreferences.clear();
                        // context.pop();
                        GoRouter.of(context).goNamed(AppRouters.loginView);
                      },
                      icon: const Icon(FontAwesomeIcons.rightFromBracket))
                ],
          centerTitle: true,
          title: Text(
            'الصفحة الرئيسية',
            style: AppStyles.textStyle25Regular(context)
                .copyWith(color: AppColors.kPrimari2),
          ),
        ),
        endDrawerEnableOpenDragGesture: false,
        endDrawer: isAdmin() ? const AdminDrwer() : null,
        body: const HomeBodyView(),
      ),
    );
  }
}
