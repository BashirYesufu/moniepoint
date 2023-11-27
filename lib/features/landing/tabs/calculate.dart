import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../UI/widgets/app_button.dart';
import '../../../UI/widgets/app_text_field.dart';
import '../../../UI/widgets/header_text.dart';
import '../../../constants/app_color.dart';
import '../../../constants/spacing.dart';
import '../../../constants/text_styles.dart';
import '../../../models/shipment_category.dart';
import '../../success.dart';

class Calculate extends HookWidget {
  const Calculate({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedCategory = useState(-1);
    return Scaffold(
      backgroundColor: AppColor.grey4,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Calculate",
            style: AppStyle.mediumTextRegular(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(title: "Destination"),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(blurRadius: 5, color: Colors.black12)
                  ],
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    AppTextField(
                        prefixIcon: RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            Icons.archive_outlined,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                        hintText: "Sender Location"),
                    YMargin(10),
                    AppTextField(
                        prefixIcon: Icon(
                          Icons.archive_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        hintText: "Receiver Location"),
                    YMargin(10),
                    AppTextField(
                        prefixIcon: Icon(
                          Icons.scale,
                          size: 18,
                          color: Colors.grey,
                        ),
                        hintText: "Approx. weight"),
                    YMargin(10)
                  ],
                ),
              ).animate().moveY(),
              const YMargin(30),
              const HeaderText(
                title: "Destination",
                subTitle: "What are you sending?",
              ),
              AppTextField(
                  prefixIcon: Image.asset(
                    "asset/icon/icon_shipment_box.png",
                  ),
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: AppColor.grey3,
                  ),
                  readOnly: true,
                  fillColor: Colors.white,
                  controller: TextEditingController(),
                  hintText: "Item")
                  .animate()
                  .fadeIn(),
              const YMargin(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderText(
                    title: "Categories",
                    subTitle: "What are you sending?",
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: 10,
                    children: ShipmentCategory.categories
                        .asMap()
                        .map(
                          (index, item) => MapEntry(
                          index,
                          GestureDetector(
                            onTap: () => selectedCategory.value = index,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                  color: index == selectedCategory.value
                                      ? AppColor.black1
                                      : null,
                                  border: index == selectedCategory.value
                                      ? null
                                      : Border.all(
                                      color: AppColor.black1),
                                  borderRadius: BorderRadius.circular(7.r)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  index == selectedCategory.value
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 3),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 14.sp,
                                    ),
                                  )
                                      : Container(),
                                  Text(item.categoryName,
                                      style: AppStyle.normalTextRegular(
                                          fontSize: 13,
                                          color:
                                          index == selectedCategory.value
                                              ? Colors.white
                                              : AppColor.black1))
                                ],
                              ),
                            ),
                          )),
                    )
                        .values
                        .toList(),
                  ),
                  const YMargin(50),
                ],
              ).animate().moveX(curve: Curves.easeIn),
              AppButton(
                title: "Calculate",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return Success();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
