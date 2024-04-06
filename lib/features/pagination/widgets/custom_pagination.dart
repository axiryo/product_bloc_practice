import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:sprout_technical_exam/features/pagination/bloc/pagination_bloc.dart';
import 'package:sprout_technical_exam/features/products/bloc/product_bloc.dart';

class CustomPagination extends StatelessWidget {
  const CustomPagination({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberPaginatorController paginationController =
        NumberPaginatorController();
    final ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);
    return BlocBuilder<PaginationBloc, PaginationState>(
      builder: (context, state) {
        if (state is PaginationActionState) {
          return NumberPaginator(
            numberPages: 10,
            initialPage: state.currentPage,
            controller: paginationController,
            onPageChange: (int index) {
              context
                  .read<PaginationBloc>()
                  .add(PaginationActionEvent(page: index));
              productBloc.add(ProductFetchEvent(page: index));
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
