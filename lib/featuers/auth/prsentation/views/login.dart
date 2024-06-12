import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/core/api/dio_helper.dart';
import 'package:shipment/featuers/auth/data/auth_repo_im.dart';
import 'package:shipment/featuers/auth/prsentation/view_model/loging_cuibt/login_cubit.dart';
import 'package:shipment/featuers/auth/prsentation/views/widgets/login_body_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepoIm(dioHelper: DioHelper())),
      child: const Scaffold(
        body: SafeArea(
          child: LoginBodyView(),
        ),
      ),
    );
  }
}
