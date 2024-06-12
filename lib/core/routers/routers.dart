import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shipment/core/routers/app_routers.dart';
import 'package:shipment/core/routers/page_animation.dart';
import 'package:shipment/featuers/admin/add_shipment/views/choose_user_view.dart';
import 'package:shipment/featuers/admin/edit_shipment/views/edit_shipment_view.dart';
import 'package:shipment/featuers/auth/prsentation/views/login.dart';
import 'package:shipment/featuers/auth/prsentation/views/signup.dart';

import '../../featuers/admin/add_admin/views/add_admin_view.dart';
import '../../featuers/admin/add_shipment/views/add_shipment_view.dart';
import '../../featuers/home/prsentation/views/home_view.dart';
import '../../featuers/spalsh/splash_view.dart';
import '../../helper/cached_helper.dart';

abstract class Routers {
  static final routers = GoRouter(routes: [
    GoRoute(
        path: AppRouters.splashView,
        pageBuilder: (context, state) => pageAnimation(
              page: const SplashScreenView(),
            )),
    GoRoute(
      redirect: (context, state) {
        if (CacheHelper.getData(key: 'id') != null) {
          return '/${AppRouters.homeView}';
        }
        return null;
      },
      path: '/${AppRouters.loginView}',
      name: AppRouters.loginView,
      pageBuilder: (context, state) => pageAnimation(
        page: const LoginView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.signUpView}',
      name: AppRouters.signUpView,
      pageBuilder: (context, state) => pageAnimation(
        page: const SignUpView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.homeView}',
      name: AppRouters.homeView,
      pageBuilder: (context, state) => pageAnimation(
        page: const HomeView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.addAdminView}',
      name: AppRouters.addAdminView,
      pageBuilder: (context, state) => pageAnimation(
        page: const AddAdminView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.addShipmentView}',
      name: AppRouters.addShipmentView,
      pageBuilder: (context, state) => pageAnimation(
        page: const AddShipmentView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.chooseUserView}',
      name: AppRouters.chooseUserView,
      pageBuilder: (context, state) => pageAnimation(
        page: ChooseUserView(
          context2: state.extra as BuildContext,
        ),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.editShipmentView}',
      name: AppRouters.editShipmentView,
      pageBuilder: (context, state) => pageAnimation(
        page: const EditShipmentView(),
      ),
    ),
  ]);
}
