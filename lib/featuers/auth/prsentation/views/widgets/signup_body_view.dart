import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shipment/core/routers/app_routers.dart';
import 'package:shipment/core/validation/validation_function.dart';
import 'package:shipment/core/widgets/custom_loading.dart';
import 'package:shipment/core/widgets/display_snac_bar.dart';
import 'package:shipment/featuers/auth/prsentation/view_model/signup_cuibt/sign_up_cubit.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text_form.dart';

class SignUpBodyView extends StatelessWidget {
  const SignUpBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<SignUpCubit>(context);
    return ZoomIn(
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            dispalySnackBar(context, message: state.message);
          } else if (state is SignUpSucsess) {
            GoRouter.of(context).goNamed(AppRouters.homeView);
          }
        },
        builder: (context, state) => Form(
          key: cuibt.key,
          child: ListView(
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: Image.asset(Assets.imagesP2),
              ),
              const SizedBox(height: 20),
              Text(
                'تسجيل ',
                style: AppStyles.textStyle23bold(context),
                textAlign: TextAlign.center,
              ),
              CustomTextFromField(
                controller: cuibt.name,
                validator: (value) {
                  return validations(value: value!, type: '');
                },
                hintText: 'الإسم',
                prefxIcon: FontAwesomeIcons.user,
              ),
              CustomTextFromField(
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
              state is SignUpLoading
                  ? const CustomLoading()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.05),
                      child: CustomElevatedButton(
                        onPressed: () {
                          cuibt.signUp();
                        },
                        title: 'تسجيل ',
                      ),
                    ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: RichText(
                      text: TextSpan(
                          style: AppStyles.textStyle20bold(context),
                          text: ' لديك حساب؟',
                          children: const [TextSpan(text: '  تسجيل الدخول ')])),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
