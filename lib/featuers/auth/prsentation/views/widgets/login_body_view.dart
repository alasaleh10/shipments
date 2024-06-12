import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shipment/core/routers/app_routers.dart';
import 'package:shipment/core/utils/app_assets.dart';
import 'package:shipment/core/utils/app_styles.dart';
import 'package:shipment/core/validation/validation_function.dart';
import 'package:shipment/core/widgets/custom_elevated_button.dart';
import 'package:shipment/core/widgets/custom_loading.dart';
import 'package:shipment/core/widgets/display_snac_bar.dart';
import 'package:shipment/featuers/auth/prsentation/view_model/loging_cuibt/login_cubit.dart';

import '../../../../../core/widgets/custom_text_form.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<LoginCubit>(context);
    return ZoomIn(
      child: Form(
        key: cuibt.key,
        child: ListView(
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Image.asset(Assets.imagesP2),
            ),
            const SizedBox(height: 20),
            Text(
              'تسجيل الدخول',
              style: AppStyles.textStyle23bold(context),
              textAlign: TextAlign.center,
            ),
            CustomTextFromField(
              textInputType: TextInputType.streetAddress,
              controller: cuibt.email,
              validator: (value) {
                return validations(value: value!, type: 'email');
              },
              hintText: 'البريد الإلكتروني',
              prefxIcon: FontAwesomeIcons.envelope,
            ),
            CustomTextFromField(
              obscureText: true,
              controller: cuibt.password,
              validator: (value) {
                return validations(value: value!, type: 'password');
              },
              hintText: 'كلمة المرور',
              prefxIcon: FontAwesomeIcons.lock,
            ),
            const SizedBox(height: 20),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  dispalySnackBar(context, message: state.message);
                } else if (state is LoginSucsess) {
                  GoRouter.of(context).goNamed(AppRouters.homeView);
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const CustomLoading();
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.05),
                    child: CustomElevatedButton(
                      onPressed: () {
                        cuibt.login();
                      },
                      title: 'تسجيل الدخول',
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(AppRouters.signUpView);
                },
                child: RichText(
                    text: TextSpan(
                        style: AppStyles.textStyle20bold(context),
                        text: 'ليس لديك حساب؟',
                        children: const [TextSpan(text: '  تسجيل')])),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
