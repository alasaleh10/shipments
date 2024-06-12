import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shipment/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipment/featuers/admin/add_shipment/add_shipment_cuibt/add_shipment_cubit.dart';
import '../../../../../core/utils/app_styles.dart';

class ChooseShipmentImage extends StatefulWidget {
  const ChooseShipmentImage({super.key});

  @override
  State<ChooseShipmentImage> createState() => _ChooseShipmentImageState();
}

class _ChooseShipmentImageState extends State<ChooseShipmentImage> {
  // File? file;

  void tackImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<AddShipmentCubit>(context).file = File(image.path);
      // file = ;
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: () {
          tackImage();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'إختــيار الصوره',
              style: AppStyles.textStyle20bold(context),
            ),
            const SizedBox(width: 15),
            const Icon(FontAwesomeIcons.image, color: AppColors.kPrimariColor)
          ],
        ),
      ),
    );
  }
}
