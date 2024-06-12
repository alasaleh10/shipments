import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shipment/core/routers/app_routers.dart';
import 'package:shipment/core/validation/validation_function.dart';
import 'package:shipment/core/widgets/custom_elevated_button.dart';
import 'package:shipment/core/widgets/custom_loading.dart';
import 'package:shipment/core/widgets/custom_text_form.dart';
import 'package:shipment/core/widgets/display_snac_bar.dart';
import 'package:shipment/featuers/admin/add_shipment/add_shipment_cuibt/add_shipment_cubit.dart';
import 'package:shipment/featuers/admin/add_shipment/views/widgets/shimpent_texts.dart';

import 'choose_shipment_image.dart';
import 'from_to_row.dart';

class AddShipmentBodyView extends StatelessWidget {
  const AddShipmentBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<AddShipmentCubit>(context);
    return Form(
      key: cuibt.key,
      child: ListView(
        children: [
          const ShipmentTexts(title: 'بيانات المرسل '),
          CustomTextFromField(
              controller: cuibt.senderName,
              validator: (value) {
                return validations(value: value!, type: '');
              },
              hintText: 'إسم المرسل',
              prefxIcon: FontAwesomeIcons.user),
          CustomTextFromField(
              controller: cuibt.senderPhone,
              validator: (value) {
                return validations(value: value!, type: 'phone');
              },
              hintText: 'جوال المرسل',
              prefxIcon: FontAwesomeIcons.phone),
          const ShipmentTexts(title: 'بيانات المستلم '),
          CustomTextFromField(
              controller: cuibt.reciverName,
              validator: (value) {
                return validations(value: value!, type: '');
              },
              hintText: 'إسم المستلم',
              prefxIcon: FontAwesomeIcons.user),
          CustomTextFromField(
              controller: cuibt.reciverPhone,
              validator: (value) {
                return validations(value: value!, type: 'phone');
              },
              hintText: 'جوال المستلم',
              prefxIcon: FontAwesomeIcons.phone),
          const ShipmentTexts(title: 'معلومات الشحنة'),
          CustomTextFromField(
              controller: cuibt.shipmentNumber,
              validator: (value) {
                return validations(value: value!, type: '');
              },
              hintText: 'رقم الشحنة',
              prefxIcon: FontAwesomeIcons.tag),
          CustomTextFromField(
              controller: cuibt.shipmentDiscreption,
              validator: (value) {
                return validations(value: value!, type: '');
              },
              hintText: 'وصف الشحنة',
              prefxIcon: FontAwesomeIcons.chartColumn),
          const FromToRowShipment(),
          CustomTextFromField(
              controller: cuibt.deliveryPhone,
              validator: (value) {
                return validations(value: value!, type: 'phone');
              },
              hintText: 'جوال السايق',
              prefxIcon: FontAwesomeIcons.phone),
          GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .pushNamed(AppRouters.chooseUserView, extra: context);
            },
            child: CustomTextFromField(
                controller: cuibt.userName,
                enable: false,
                hintText: 'إختيار العميل',
                prefxIcon: FontAwesomeIcons.user),
          ),
          const ChooseShipmentImage(),
          BlocConsumer<AddShipmentCubit, AddShipmentState>(
            listener: (context, state) {
              if (state is AddShipmentIFailure) {
                dispalySnackBar(context, message: state.message);
              } else if (state is AddShipmentSucsess) {
                dispalySnackBar(context, message: 'تمت الإضافة');
              }
            },
            builder: (context, state) {
              if (state is AddShipmentLoading) {
                return const CustomLoading();
              } else {
                return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.05,
                        vertical: 10),
                    child: CustomElevatedButton(
                        title: 'إضافه',
                        onPressed: () {
                          cuibt.cheekData();
                        }));
              }
            },
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
