import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout_technical_exam/common/widgets/empty_placeholder.dart';
import 'package:sprout_technical_exam/common/widgets/product_loading_widget.dart';
import 'package:sprout_technical_exam/common/widgets/search_text_field.dart';
import 'package:sprout_technical_exam/features/products/bloc/product_bloc.dart';
import 'package:sprout_technical_exam/features/products/widgets/product_list_item.dart';
import 'package:sprout_technical_exam/models/product/product_list_item_model.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  ProductListViewState createState() => ProductListViewState();
}

class ProductListViewState extends State<ProductListView> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: SearchTextField(
            onSearchChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<ProductBloc, ProductState>(
            bloc: productBloc,
            builder: (context, state) {
              if (state is ProductFetchSuccessState) {
                List<ProductListItem> filteredProducts = state.products
                    .where((product) =>
                        searchQuery.isEmpty ||
                        product.title
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()))
                    .toList();
                return filteredProducts.isEmpty
                    ? const EmptyPlaceholder(
                        message: 'No such product is found')
                    : ListView.builder(
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return ProductListTileWidget(product: product);
                        },
                      );
              } else if (state is ProductFetchLoadingState) {
                return const ProductLoadingStateWidget();
              } else {
                return const EmptyPlaceholder(message: 'No products found');
              }
            },
          ),
        ),
      ],
    );
  }
}
