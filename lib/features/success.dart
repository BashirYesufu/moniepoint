import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../UI/widgets/app_button.dart';
import '../UI/widgets/counting_amount_view.dart';
import '../constants/app_color.dart';
import '../constants/spacing.dart';
import '../constants/text_styles.dart';

class Success extends HookWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    var isTapped = useState(false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MoveMate",
                  style: AppStyle.mediumTextMedium(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)
                      .copyWith(fontStyle: FontStyle.italic),
                ),
                const XMargin(5),
                Image.asset(
                  "asset/icon/icon_movemate.png",
                  scale: 2,
                ),
              ],
            ),
            const YMargin(20),
            Image.asset(
              "asset/icon/icon_shipment_box.png",
              scale: 2.0,
            ),
            const YMargin(15),
            Text(
              "Total Estimated Amount",
              style: AppStyle.mediumTextMedium(fontSize: 18),
            ),
            const YMargin(8),
            const CountingAmountView(),
            const YMargin(8),
            Text(
              "This amount is estimated this will vary if you change your location or weight",
              textAlign: TextAlign.center,
              style: AppStyle.normalTextRegular(color: AppColor.grey5),
            ),
            const YMargin(35),
            AppButton(
              title: "Back to Home",
              onTap: () {
                isTapped.value = !isTapped.value;
                Navigator.pop(context);
              },
            )
                .animate(
              target: isTapped.value ? 1 : 0.9,
            )
                .scaleXY(curve: Curves.bounceInOut)
          ],
        ),
      ),
    );
  }
}
