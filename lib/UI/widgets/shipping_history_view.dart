import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../constants/app_color.dart';
import '../../constants/spacing.dart';
import '../../constants/text_styles.dart';
import '../../models/shipment_history.dart';

class ShipmentHistoryView extends HookWidget {
  final List<ShipmentHistory> shipmentList;
  const ShipmentHistoryView(
      {super.key, required this.shipmentList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: shipmentList.length,
        itemBuilder: (ctx, index) {
          final ShipmentHistory shipmentHistory =
          shipmentList[index];
          return Container(
            margin: EdgeInsets.only(bottom: 15.h),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                            color: AppColor.grey2,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              (shipmentHistory.status ==
                                  ShipmentStatus.completed
                                  ? CupertinoIcons.check_mark_circled
                                  : shipmentHistory.status ==
                                  ShipmentStatus.pending
                                  ? CupertinoIcons.timer
                                  : Icons.cached_outlined),
                              size: 14.sp,
                              color: shipmentHistory.status.color,
                            ),
                            const XMargin(5),
                            Text(
                              shipmentHistory.status.title.toLowerCase(),
                              style: AppStyle.smallTextRegular(
                                fontWeight: FontWeight.bold,
                                color: shipmentHistory.status.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const YMargin(5),
                      Text(
                        "Arriving Today!",
                        style: AppStyle.mediumTextRegular(
                            fontWeight: FontWeight.bold),
                      ),
                      const YMargin(5),
                      Text(
                        "Your delivery, ${shipmentHistory.id} from ${shipmentHistory.location} is arriving today",
                        style: AppStyle.smallTextRegular(
                            color: AppColor.grey5),
                      ),
                      const YMargin(8),
                      Row(
                        children: [
                          Text(
                            "\$${shipmentHistory.amount} USD",
                            style: AppStyle.normalTextRegular(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          Container(
                            width: 4.w,
                            height: 4.h,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: AppColor.grey4,
                                shape: BoxShape.circle),
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(shipmentHistory.date),
                            style: AppStyle.normalTextRegular(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Image.asset(
                  "asset/icon/icon_shipment_box.png",
                  height: 70.h,
                  width: 70.w,
                )
              ],
            ),
          ).animate().fade(begin: 0.8, end: 1).slideY(begin: 1, end: 0);
        });
  }
}
