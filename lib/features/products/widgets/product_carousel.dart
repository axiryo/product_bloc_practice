import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sprout_technical_exam/common/widgets/common_ui.dart';

class ProductCarousel extends StatelessWidget {
  final List<String> images;
  const ProductCarousel({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Column(
      children: [
        SizedBox(
          height: 300.h,
          width: double.maxFinite,
          child: PageView.builder(
            itemCount: images.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return CommonUI.cachedNetworkImageWithPlaceholder(
                  imageUrl: images[index]);
            },
          ),
        ),
        SizedBox(height: 8.h),
        Center(
          child: SmoothPageIndicator(
              controller: pageController,
              count: images.length,
              effect: ScrollingDotsEffect(
                activeStrokeWidth: 2.6,
                activeDotScale: 1.3.sp,
                maxVisibleDots: 5,
                radius: 8,
                spacing: 10,
                dotHeight: 8.h,
                dotWidth: 8.h,
              )),
        ),
      ],
    );
  }
}
