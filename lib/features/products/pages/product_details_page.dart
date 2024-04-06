import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout_technical_exam/common/widgets/app_bar.dart';
import 'package:sprout_technical_exam/common/widgets/custom_button.dart';
import 'package:sprout_technical_exam/common/widgets/empty_placeholder.dart';
import 'package:sprout_technical_exam/common/widgets/product_loading_widget.dart';
import 'package:sprout_technical_exam/features/products/bloc/product_bloc.dart';
import 'package:sprout_technical_exam/features/products/widgets/product_carousel.dart';
import 'package:sprout_technical_exam/features/products/widgets/product_overview.dart';
import 'package:sprout_technical_exam/models/product/product_detail_model.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ProductBloc productBloc = ProductBloc();

  @override
  void initState() {
    productBloc.add(ProductFetchByIdEvent(productId: widget.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'DETAILS'),
      body: BlocConsumer<ProductBloc, ProductState>(
        bloc: productBloc,
        listener: (context, state) {
          //
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProductFetchByIdSuccessState:
              ProductDetail productDetail =
                  (state as ProductFetchByIdSuccessState).product;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductCarousel(images: productDetail.images),
                    ProductOverview(productDetail: productDetail),
                  ],
                ),
              );
            case ProductFetchByIdLoadingState:
              return const ProductLoadingStateWidget();
            case ProductFetchByIdErrorState:
              return const Center(
                child: Text('Something went wrong.'),
              );
            default:
              return const EmptyPlaceholder(message: 'No products found');
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
        child: CustomButton(
          onTapFunction: () {},
          description: 'Buy now',
        ),
      ),
    );
  }
}
