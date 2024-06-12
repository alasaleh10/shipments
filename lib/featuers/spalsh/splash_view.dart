import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shipment/core/routers/app_routers.dart';
import 'package:shipment/core/utils/app_assets.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).goNamed(AppRouters.loginView);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1.4,
              child: Image.asset(Assets.imagesP2),
            )
          ],
        ),
      ),
    );
  }
}
