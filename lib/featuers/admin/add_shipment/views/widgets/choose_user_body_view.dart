import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shipment/core/utils/app_colors.dart';
import 'package:shipment/core/utils/app_styles.dart';
import 'package:shipment/core/widgets/custom_loading.dart';
import 'package:shipment/core/widgets/custom_text_form.dart';
import 'package:shipment/featuers/admin/add_shipment/add_shipment_cuibt/add_shipment_cubit.dart';
import 'package:shipment/featuers/admin/add_shipment/choose_users_cuibt/choose_users_cubit.dart';

class ChooseUserBodyView extends StatelessWidget {
  final BuildContext context2;
  const ChooseUserBodyView({super.key, required this.context2});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<ChooseUsersCubit>(context);
    return ListView(
      children: [
        const SizedBox(height: 20),
        CustomTextFromField(
            onChanged: (val) {
              cuibt.searchUser(val);
            },
            hintText: 'بحث عن عميل',
            prefxIcon: FontAwesomeIcons.user),
        const SizedBox(height: 20),
        BlocBuilder<ChooseUsersCubit, ChooseUsersState>(
          builder: (context, state) {
            if (state is ChooseUsersLoading) {
              return const CustomLoading();
            } else if (state is ChooseUsersFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: AppStyles.textStyle23bold(context),
                ),
              );
            } else if (state is ChooseUsersSucsess) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<AddShipmentCubit>(context2).chooseUse(
                          userId: state.users[index].userId!,
                          name: state.users[index].userName!);
                      context.pop();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            state.users[index].userName!,
                            style: AppStyles.textStyle20bold(context),
                          ),
                        ),
                        const Divider(
                          color: AppColors.kPrimariColor,
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
