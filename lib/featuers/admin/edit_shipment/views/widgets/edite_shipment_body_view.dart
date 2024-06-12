import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shipment/core/utils/app_colors.dart';
import 'package:shipment/core/utils/app_styles.dart';
import 'package:shipment/core/widgets/custom_elevated_button.dart';
import 'package:shipment/core/widgets/custom_loading.dart';
import 'package:shipment/core/widgets/custom_text_form.dart';
import 'package:shipment/core/widgets/display_snac_bar.dart';
import 'package:shipment/featuers/admin/edit_shipment/view_model/edit_shipment_cuibt/edit_shipment_cubit.dart';
import 'package:shipment/featuers/admin/edit_shipment/views/widgets/shipment_status_dropn_button.dart';

class EditShimpmentBodyView extends StatelessWidget {
  const EditShimpmentBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<EditShipmentCubit>(context);
    return ListView(
      children: [
        const SizedBox(height: 30),
        CustomTextFromField(
            isPassword: true,
            suffixIcon: IconButton(
              onPressed: () {
                cuibt.searchShipment();
              },
              icon: const Icon(Icons.search, color: AppColors.kPrimariColor),
            ),
            controller: cuibt.shipment,
            hintText: 'بحث برقم الشحنة',
            prefxIcon: FontAwesomeIcons.searchengin),
        BlocBuilder<EditShipmentCubit, EditShipmentState>(
          // buildWhen: (previous, current) {
          //   print(current is! EditShipmentFailure2);
          //   return true;
          // },
          buildWhen: (previous, current) =>
              current is! EditShipmentFailure2 &&
              current is! EditShipmentSucsess2 &&
              current is! EditShipmentLoading2,
          builder: (context, state) {
            if (state is EditShipmentFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: AppStyles.textStyle23bold(context),
                ),
              );
            } else if (state is EditShipmentSucsess) {
              return Column(
                children: [
                  CustomTextFromField(
                      controller: cuibt.location,
                      hintText: 'موقع الشحنة الحالي',
                      prefxIcon: FontAwesomeIcons.locationDot),
                  ShipmentStatusDropButton(stats: cuibt.status),
                 const SizedBox(height: 20),
                  BlocConsumer<EditShipmentCubit, EditShipmentState>(
                    listener: (context, state) {
                      if (state is EditShipmentFailure2) {
                        dispalySnackBar(context, message: state.message);
                      } else if (state is EditShipmentSucsess2) {
                        dispalySnackBar(context, message: 'تم التعديل');
                        context.pop();
                      }
                    },
                    builder: (context, state) {
                      if (state is EditShipmentLoading2) {
                        return const CustomLoading();
                      } else {
                        return CustomElevatedButton(
                            title: 'تعديل',
                            onPressed: () {
                              cuibt.editeShipment();
                            });
                      }
                    },
                  )
                ],
              );
            } else if (state is EditShipmentLoading) {
              return const CustomLoading();
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
