import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout_technical_exam/common/widgets/common_ui.dart';

class ProductThumbnail extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? widget;

  const ProductThumbnail(
      {super.key, required this.imageUrl, this.height, this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 120.w,
      child: CommonUI.cachedNetworkImageWithPlaceholder(
        imageUrl: imageUrl,
      ),
    );
  }
}
