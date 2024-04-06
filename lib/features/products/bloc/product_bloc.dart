import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sprout_technical_exam/models/product/product_detail_model.dart';
import 'package:sprout_technical_exam/models/product/product_list_item_model.dart';
import 'package:sprout_technical_exam/repository/products/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductFetchEvent>(productFetchEvent);
    on<ProductFetchByIdEvent>(productFetchByIdEvent);
    on<NavigateToProductDetailsPageEvent>(navigateToProductDetailsPageEvent);
  }

  FutureOr<void> productFetchEvent(
      ProductFetchEvent event, Emitter<ProductState> emit) async {
    emit(ProductFetchLoadingState());
    try {
      int productSkip = (event.page) * event.limit;
      List<ProductListItem> products = await ProductRepository.fetchProducts(
          productSkip: productSkip, limit: event.limit);
      emit(ProductFetchSuccessState(products: products));
    } catch (e) {
      emit(ProductFetchErrorState());
    }
  }

  FutureOr<void> productFetchByIdEvent(
      ProductFetchByIdEvent event, Emitter<ProductState> emit) async {
    emit(ProductFetchByIdLoadingState());
    try {
      ProductDetail product =
          await ProductRepository.fetchProductById(event.productId.toString());
      emit(ProductFetchByIdSuccessState(product: product));
    } catch (e) {
      emit(ProductFetchErrorState());
    }
  }

  FutureOr<void> navigateToProductDetailsPageEvent(
      NavigateToProductDetailsPageEvent event, Emitter<ProductState> emit) {
    emit(NavigateToProductDetailsActionState(productId: event.productId));
  }
}
