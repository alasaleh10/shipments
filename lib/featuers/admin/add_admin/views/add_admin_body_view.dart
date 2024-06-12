import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shipment/core/validation/validation_function.dart';
import 'package:shipment/core/widgets/custom_elevated_button.dart';
import 'package:shipment/core/widgets/custom_loading.dart';
import 'package:shipment/core/widgets/custom_text_form.dart';
import 'package:shipment/core/widgets/display_snac_bar.dart';
import 'package:shipment/featuers/admin/add_admin/add_admin_cuibt/add_admin_cubit.dart';

class AddAdminBodyView extends StatelessWidget {
  const AddAdminBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<AddAdminCubit>(context);
    return Form(
      key: cuibt.key,
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * .2),
          CustomTextFromField(
              controller: cuibt.name,
              validator: (value) {
                return validations(value: value!, type: '');
              },
              hintText: 'الإسم',
              prefxIcon: FontAwesomeIcons.user),
          CustomTextFromField(
              controller: cuibt.email,
              validator: (value) {
                return validations(value: value!, type: 'email');
              },
              hintText: 'البريد الإلكتروني',
              prefxIcon: FontAwesomeIcons.envelope),
          CustomTextFromField(
              controller: cuibt.password,
              validator: (value) {
                return validations(value: value!, type: 'password');
              },
              hintText: 'كلمة المرور',
              prefxIcon: FontAwesomeIcons.lock),
          const SizedBox(height: 40),
          BlocConsumer<AddAdminCubit, AddAdminState>(
            listener: (context, state) {
              if (state is AddAdminFailure) {
                dispalySnackBar(context, message: state.message);
              } else if (state is AddAdminSucsess) {
                dispalySnackBar(context,
                    message:
                        'تمت اضافة الادمن ${state.userModel.userName} بنجاح');
              }
            },
            builder: (context, state) {
              if (state is AddAdminLoading) {
                return const CustomLoading();
              } else {
                return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * .05),
                    child: CustomElevatedButton(
                        title: 'إضافة',
                        onPressed: () {
                          cuibt.addAdmin();
                        }));
              }
            },
          )
        ],
      ),
    );
  }
}
