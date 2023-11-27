import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class ReceiptScanView extends StatelessWidget {
  const ReceiptScanView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      const BoxDecoration(color: AppColor.pending, shape: BoxShape.circle),
      child: const Icon(
        Icons.qr_code_scanner,
        color: Colors.white,
      ),
    );
  }
}