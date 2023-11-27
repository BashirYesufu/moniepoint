import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_color.dart';
import '../../constants/spacing.dart';
import '../../constants/text_styles.dart';
import '../../models/shipment_item.dart';

class SearchItemView extends StatelessWidget {
  const SearchItemView({
    super.key,
    required this.itemModel,
  });

  final ShipmentItem itemModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          child: Image.asset(
            "asset/icon/icon_shipment_box.png",
            height: 25.h,
            width: 25.w,
          ),
        ),
        const XMargin(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemModel.itemName,
              style: AppStyle.normalTextRegular(fontWeight: FontWeight.bold),
            ),
            const YMargin(2),
            Text(
              "${itemModel.itemId} • ${itemModel.fromLocation} → ${itemModel.toLocation}",
              style: AppStyle.smallTextRegular(color: AppColor.grey5),
            ),
          ],
        ),
      ],
    );
  }
}
