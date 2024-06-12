import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shipment/core/routers/routers.dart';
import 'package:shipment/core/utils/app_colors.dart';

import 'featuers/auth/prsentation/views/widgets/simple_observer.dart';
import 'generated/l10n.dart';
import 'helper/cached_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  CacheHelper.onInitCacheHelper();
  Bloc.observer = SimpleObserver();

  runApp(const Shipment());
}

class Shipment extends StatelessWidget {
  const Shipment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routers.routers,
      locale: const Locale('ar'),
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kPrimari2,
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.kPrimariColor,
              iconTheme: IconThemeData(color: AppColors.kPrimari2))),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
