part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductFetchEvent extends ProductEvent {
  final int page;
  final int limit;

  ProductFetchEvent({required this.page, this.limit = 10});
}

class ProductFetchByIdEvent extends ProductEvent {
  final int productId;

  ProductFetchByIdEvent({required this.productId});
}

class NavigateToProductDetailsPageEvent extends ProductEvent {
  final int productId;

  NavigateToProductDetailsPageEvent({required this.productId});
}
