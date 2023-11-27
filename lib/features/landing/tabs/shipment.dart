import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../UI/widgets/header_text.dart';
import '../../../UI/widgets/shipping_history_view.dart';
import '../../../constants/app_color.dart';
import '../../../constants/text_styles.dart';
import '../../../models/shipment_history.dart';

class Shipment extends HookWidget {
  const Shipment({super.key});

  @override
  Widget build(BuildContext context) {
    var currentTab = useState(0);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: AppColor.grey4,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(
                onTap: (value) => currentTab.value = value,
                isScrollable: true,
                indicatorColor: AppColor.pending,
                labelColor: Colors.white,
                unselectedLabelColor: AppColor.grey1,
                tabs: [
                  ShipmentStatus.all,
                  ShipmentStatus.completed,
                  ShipmentStatus.progress,
                  ShipmentStatus.pending
                ]
                    .asMap()
                    .map((index, item) => MapEntry(
                  index,
                  Tab(
                      icon: Row(
                        children: [
                          Text(item.title),
                          Container(
                            margin: EdgeInsets.only(left: 8.w),
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 10),
                            decoration: BoxDecoration(
                                color: index == currentTab.value
                                    ? AppColor.pending
                                    : Colors.white10,
                                borderRadius: BorderRadius.circular(15.r)),
                            child: Text(
                              (item != ShipmentStatus.all
                                  ? ShipmentHistory.shipmentHistory
                                  .where((element) =>
                              element.status == item)
                                  .length
                                  : ShipmentHistory
                                  .shipmentHistory.length)
                                  .toString(),
                              style: AppStyle.smallTextRegular(
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )).animate(
                      effects: index == currentTab.value
                          ? [
                        const ScaleEffect(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        )
                      ]
                          : []),
                ))
                    .values
                    .toList()),
            title: Text(
              'Shipment History',
              style: AppStyle.mediumTextRegular(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const HeaderText(title: "Shipments"),
                Expanded(
                  child: TabBarView(
                    children: [
                      ShipmentHistoryView(
                          shipmentList:
                          ShipmentHistory.shipmentHistory),
                      ShipmentHistoryView(
                        shipmentList: ShipmentHistory
                            .shipmentHistory
                            .where((element) =>
                        element.status ==
                            ShipmentStatus.completed)
                            .toList(),
                      ),
                      ShipmentHistoryView(
                        shipmentList: ShipmentHistory
                            .shipmentHistory
                            .where((element) =>
                        element.status ==
                            ShipmentStatus.progress)
                            .toList(),
                      ),
                      ShipmentHistoryView(
                        shipmentList: ShipmentHistory
                            .shipmentHistory
                            .where((element) =>
                        element.status == ShipmentStatus.pending)
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
