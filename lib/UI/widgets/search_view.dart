import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint/UI/widgets/reciept_scan_view.dart';
import 'package:moniepoint/UI/widgets/search_item_view.dart';
import '../../constants/app_color.dart';
import '../../constants/spacing.dart';
import '../../models/shipment_item.dart';
import 'app_text_field.dart';

class SearchView extends HookWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = useTextEditingController();
    var filteredItems = useState(ShipmentItem.shipmentItems);
    return Scaffold(
      backgroundColor: AppColor.grey4,
      appBar: AppBar(
        leading: Container(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                    const XMargin(5),
                    Expanded(
                      child: AppTextField(
                          suffixIcon: const ReceiptScanView(),
                          onChanged: (value) {
                            filteredItems.value = ShipmentItem
                                .shipmentItems
                                .where((element) =>
                            element.itemId
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                                element.itemName
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          },
                          showPrefixIconBorder: false,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(
                              CupertinoIcons.search,
                              size: 18.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          radius: 60,
                          controller: searchController,
                          hintText: "Enter receipt number or item name"),
                    ),
                  ],
                ),
              ),
              const YMargin(20)
            ],
          ).animate().fadeIn(),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          margin: const EdgeInsets.all(20),
          child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                color: AppColor.grey2,
              ),
              itemCount: filteredItems.value.length,
              itemBuilder: (ctx, index) {
                ShipmentItem itemModel = filteredItems.value[index];
                return SearchItemView(itemModel: itemModel)
                    .animate(effects: [const MoveEffect()]);
              })),
    );
  }
}

