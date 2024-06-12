import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shipment/helper/cached_helper.dart';

import '../../core/routers/app_routers.dart';
import '../../core/widgets/custom_grident.dart';
import '../../core/widgets/drwew_list_tile.dart';

class AdminDrwer extends StatelessWidget {
  const AdminDrwer({super.key});

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      child: Container(
        width: MediaQuery.sizeOf(context).width * .8,
        decoration: BoxDecoration(gradient: customGradient()),
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .1),
            DrwerLitTile(
              onTap: () {
                context.pop();
                GoRouter.of(context).pushNamed(AppRouters.addAdminView);
              },
              title: 'إضافة أدمن',
            ),
            const Divider(),
            DrwerLitTile(
              onTap: () {
                context.pop();
                GoRouter.of(context).pushNamed(AppRouters.addShipmentView);
              },
              title: 'إضافة شحنة',
            ),
            const Divider(),
            DrwerLitTile(
              icon: FontAwesomeIcons.penToSquare,
              onTap: () {
                context.pop();
                GoRouter.of(context).pushNamed(AppRouters.editShipmentView);
              },
              title: 'تعديل شحنة',
            ),
            const Divider(),
            DrwerLitTile(
              icon: FontAwesomeIcons.rightFromBracket,
              onTap: () {
                CacheHelper.sharedPreferences.clear();
                context.pop();
                GoRouter.of(context).goNamed(AppRouters.loginView);
              },
              title: 'تسجيل الخروج',
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
