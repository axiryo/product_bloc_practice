import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout_technical_exam/features/products/bloc/product_bloc.dart';
import 'package:sprout_technical_exam/features/products/pages/product_details_page.dart';
import 'package:sprout_technical_exam/features/products/widgets/product_information.dart';
import 'package:sprout_technical_exam/features/products/widgets/product_thumbnail.dart';
import 'package:sprout_technical_exam/models/product/product_list_item_model.dart';

class ProductListTileWidget extends StatelessWidget {
  final ProductListItem product;

  const ProductListTileWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    ProductBloc productBloc = ProductBloc();
    return BlocListener<ProductBloc, ProductState>(
      bloc: productBloc,
      listener: (context, state) {
        if (state is NavigateToProductDetailsActionState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProductDetailsPage(productId: state.productId),
          ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.sp),
        child: GestureDetector(
          onTap: () => productBloc
              .add(NavigateToProductDetailsPageEvent(productId: product.id)),
          child: Container(
            color: theme.colorScheme.primaryContainer,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: ProductThumbnail(imageUrl: product.thumbnail)),
                ProductInformation(product: product),
                Padding(
                  padding: EdgeInsets.only(right: 8.sp),
                  child: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
