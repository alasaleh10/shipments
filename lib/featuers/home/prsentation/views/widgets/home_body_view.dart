import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shipment/core/utils/app_colors.dart';
import 'package:shipment/core/utils/app_styles.dart';
import 'package:shipment/core/widgets/custom_loading.dart';

import 'package:shipment/core/widgets/custom_text_form.dart';
import 'package:shipment/featuers/home/prsentation/view_model/cubit/home_cubit.dart';

import 'package:shipment/featuers/home/prsentation/views/widgets/shipment_detils.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<HomeCubit>(context);
    return ListView(
      children: [
        const SizedBox(height: 50),
        CustomTextFromField(
            isPassword: true,
            suffixIcon: IconButton(
                onPressed: () {
                  cuibt.getShipment();
                },
                icon: const Icon(
                  Icons.search,
                  color: AppColors.kPrimariColor,
                )),
            controller: cuibt.number,
            hintText: 'بحث عن شحنة',
            prefxIcon: FontAwesomeIcons.searchengin),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: AppStyles.textStyle23bold(context),
                ),
              );
            } else if (state is HomeSucsess) {
              return ShipmentDetils(
                data: state.shipmentModel,
              );
            } else if (state is HomeLoading) {
              return const CustomLoading();
            } else {
              return Center(
                child: Text(
                  'إبحث عن الشحنة',
                  style: AppStyles.textStyle23bold(context),
                ),
              );
            }
          },
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
