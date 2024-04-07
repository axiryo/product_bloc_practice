import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_technical_exam/common/widgets/app_bar.dart';
import 'package:sprout_technical_exam/features/pagination/bloc/pagination_bloc.dart';
import 'package:sprout_technical_exam/features/pagination/widgets/custom_pagination.dart';
import 'package:sprout_technical_exam/features/products/bloc/product_bloc.dart';
import 'package:sprout_technical_exam/features/products/widgets/product_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc()..add(ProductFetchEvent(page: 0)),
        ),
        BlocProvider(
          create: (context) =>
              PaginationBloc()..add(PaginationActionEvent(page: 0)),
        ),
      ],
      child: Scaffold(
        appBar: homeAppBar(context, title: 'PRODUCTS'),
        body: const ProductListView(),
        bottomNavigationBar: const CustomPagination(),
      ),
    );
  }
}
