import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shipment/core/api/end_points.dart';
import 'package:shipment/featuers/admin/edit_shipment/data/shipment_model.dart';

import '../../../../../core/functions/shipment_type.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../admin/add_shipment/views/widgets/shimpent_texts.dart';
import 'home_shipment_row.dart';

class ShipmentDetils extends StatelessWidget {
  final ShipmentModel data;
  const ShipmentDetils({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.kPrimariColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
              text: TextSpan(
                  style: AppStyles.textStyle20bold(context),
                  text: 'رقم الشحنة : ',
                  children: const [TextSpan(text: '22')])),
          const SizedBox(height: 15),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * .1),
            child: Container(
              height: MediaQuery.sizeOf(context).height * .3,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                          '${EndPoint.baseUrl}/upload/${data.shipmentImage}'),
                      fit: BoxFit.fill)),
            ),
          )

          // CircleAvatar(
          //   radius: 80,
          //   backgroundImage: NetworkImage(
          //       '${EndPoint.baseUrl}/upload/${data.shipmentImage}'),
          // ),
          // ClipPath(
          //   // clipper: const ShapeBorderClipper(shape: CircleBorder()),
          //   clipBehavior: Clip.antiAlias,
          //   child: Image.network(
          //     '${EndPoint.baseUrl}/upload/${data.shipmentImage}',
          //     height: 150.0,
          //     width: 150.0,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          ,
          const ShipmentTexts(title: "بيانات المرسل"),
          HomeShipmentRow(title: 'المرسل', subTitle: data.senderName!),
          HomeShipmentRow(title: 'جوال المرسل', subTitle: data.senderPhone!),
          const ShipmentTexts(title: "بيانات المستلم"),
          HomeShipmentRow(title: 'المستلم', subTitle: data.reciverName!),
          HomeShipmentRow(title: 'جوال المستلم', subTitle: data.reciverPhone!),
          const ShipmentTexts(title: "بيانات الشحنه"),
          HomeShipmentRow(
              title: 'وصف الشحنه', subTitle: data.shipmentDiscription!),
          HomeShipmentRow(
              title: 'موقعها الحالي', subTitle: data.shipmentCurrrentLocation!),
          HomeShipmentRow(title: 'الإنطلاقة', subTitle: data.shipmentFrom!),
          // const HomeShipmentRow(title: 'الإنطلاقة', subTitle: '777777'),
          HomeShipmentRow(title: 'الوصول', subTitle: data.shipmentTo!),
          HomeShipmentRow(title: 'وضع الشحنة', subTitle: shipmentType(1)),
          HomeShipmentRow(
              title: 'رقم جوال السايق', subTitle: data.deliveryPhone!),
          HomeShipmentRow(
              title: 'تاريخ الشحنه', subTitle: data.shipmentDate.toString()),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
