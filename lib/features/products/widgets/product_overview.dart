import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout_technical_exam/common/utils/price_utils.dart';
import 'package:sprout_technical_exam/models/product/product_detail_model.dart';

class ProductOverview extends StatelessWidget {
  final ProductDetail productDetail;

  const ProductOverview({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Text(
            productDetail.category,
            style: TextStyle(
              color: theme.colorScheme.primaryContainer,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          productDetail.title.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            letterSpacing: 2.sp,
          ),
        ),
        Text(
          'by ${productDetail.brand}',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: theme.colorScheme.secondary,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Icon(
              Icons.star,
              color: const Color.fromARGB(255, 223, 201, 2),
              size: 18.sp,
            ),
            SizedBox(height: 16.h),
            Text(
              productDetail.rating.toString(),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          'DESCRIPTION',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          productDetail.description,
          style: TextStyle(color: theme.colorScheme.secondary),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 2.sp),
              child: Text(
                PriceUtils.formatDiscountedPrice(
                    productDetail.price, productDetail.discountPercentage),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 2.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 1.sp),
              child: Text(
                PriceUtils.formatPrice(productDetail.price),
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            Container(
              color: theme.colorScheme.tertiary,
              padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 2.sp),
              child: Text(
                '${productDetail.discountPercentage}% OFF',
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          'Only ${productDetail.stock} left',
        ),
      ]),
    );
  }
}
