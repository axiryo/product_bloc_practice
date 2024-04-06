import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout_technical_exam/common/utils/price_utils.dart';
import 'package:sprout_technical_exam/models/product/product_list_item_model.dart';

class ProductInformation extends StatelessWidget {
  final ProductListItem product;

  const ProductInformation({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200.w,
                child: Text(
                  product.title,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: theme.colorScheme.primary,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.sp, vertical: 2.sp),
                    child: Text(
                      PriceUtils.formatDiscountedPrice(
                          product.price, product.discountPercentage),
                      style: TextStyle(
                        color: theme.colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.sp, vertical: 1.sp),
                    child: Text(
                      PriceUtils.formatPrice(product.price),
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  const Text("Qty: "),
                  Text(
                    product.stock.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 120,
                  height: 24,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.sp, vertical: 1.sp),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                      child: FittedBox(
                    child: Row(
                      children: [
                        Text(
                          'ADD TO CART',
                          style:
                              TextStyle(fontSize: 16.sp, fontFamily: 'Poppins'),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
