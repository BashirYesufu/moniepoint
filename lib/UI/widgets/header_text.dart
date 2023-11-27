import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/spacing.dart';
import '../../constants/text_styles.dart';

class HeaderText extends StatelessWidget {
  final String title;
  final String? subTitle;
  const HeaderText({super.key, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.mediumTextMedium(),
        ),
        const YMargin(2),
        subTitle != null
            ? Text(
          subTitle!,
          style: AppStyle.normalTextRegular(color: AppColor.grey5),
        )
            : Container(),
        const YMargin(10)
      ],
    );
  }
}
