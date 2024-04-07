import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_technical_exam/models/product/product_detail_model.dart';
import 'package:sprout_technical_exam/models/product/product_list_item_model.dart';
import 'package:sprout_technical_exam/repository/products/product_repository.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;
  late ProductRepository productRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    productRepository = ProductRepository();
  });

  const testProductListItemModel = [
    ProductListItem(
      id: 1,
      title: 'iPhone 9',
      price: 549,
      thumbnail: 'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
      stock: 94,
      discountPercentage: 12.96,
    )
  ];

  const int productSkip = 0;

  const testProductDetailModel = ProductDetail(
    id: 1,
    title: 'iPhone 9',
    description: 'An apple mobile which is nothing like apple',
    price: 549,
    discountPercentage: 12.96,
    rating: 4.69,
    stock: 94,
    brand: 'Apple',
    category: 'smartphones',
    thumbnail: 'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
    images: [
      'https://cdn.dummyjson.com/product-images/1/1.jpg',
      'https://cdn.dummyjson.com/product-images/1/2.jpg',
      'https://cdn.dummyjson.com/product-images/1/3.jpg',
      'https://cdn.dummyjson.com/product-images/1/4.jpg',
      'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg'
    ],
  );

  const String productId = '1';

  group('get list of products', () {
    test(
        'Should return list of products when a call to repository is successful',
        () async {
      // Arrange
      when(mockProductRepository.fetchProducts(productSkip: productSkip))
          .thenAnswer((_) async => testProductListItemModel);

      // Act
      final result = await productRepository.fetchProducts(
          productSkip: productSkip, limit: 1);

      // Assert
      expect(result, equals(testProductListItemModel));
    });
  });

  group('get product details', () {
    test(
        'Should return product details when a call to repository is successful',
        () async {
      // Arrange
      when(mockProductRepository.fetchProductById(productId))
          .thenAnswer((_) async => testProductDetailModel);

      // Act
      final result = await productRepository.fetchProductById(productId);

      // Assert
      expect(result, equals(testProductDetailModel));
    });
  });
}
