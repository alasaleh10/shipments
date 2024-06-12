import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/core/api/dio_helper.dart';
import 'package:shipment/featuers/auth/data/auth_repo_im.dart';
import 'package:shipment/featuers/auth/prsentation/view_model/signup_cuibt/sign_up_cubit.dart';
import 'package:shipment/featuers/auth/prsentation/views/widgets/signup_body_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(AuthRepoIm(dioHelper: DioHelper())),
      child: const Scaffold(
        body: SafeArea(
          child: SignUpBodyView(),
        ),
      ),
    );
  }
}
