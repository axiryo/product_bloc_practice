part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductFetchSuccessState extends ProductState {
  final List<ProductListItem> products;
  ProductFetchSuccessState({required this.products});
}

final class ProductFetchLoadingState extends ProductState {}

final class ProductFetchErrorState extends ProductState {}

final class ProductFetchByIdSuccessState extends ProductState {
  final ProductDetail product;

  ProductFetchByIdSuccessState({required this.product});
}

final class ProductFetchByIdLoadingState extends ProductState {}

final class ProductFetchByIdErrorState extends ProductState {}

final class NavigateToProductDetailsActionState extends ProductState {
  final int productId;

  NavigateToProductDetailsActionState({required this.productId});
}
