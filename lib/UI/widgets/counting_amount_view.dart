import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../constants/app_color.dart';
import '../../constants/text_styles.dart';

class CountingAmountView extends HookWidget {
  const CountingAmountView({super.key});
  @override
  Widget build(BuildContext context) {
    final animationCtrl = useAnimationController(
      duration: const Duration(milliseconds: 5000),
      initialValue: 1120,
      upperBound: 1420,
    );
    useEffect(() {
      animationCtrl.forward();
      return null;
    }, []);

    return Center(
      child: AnimatedBuilder(
        animation: animationCtrl,
        builder: (context, child) {
          return Text(
            "\$${animationCtrl.value.toInt()} USD",
            style: AppStyle.mediumTextMedium(
                color: AppColor.success, fontSize: 20),
          );
        },
      ),
    );
  }
}
