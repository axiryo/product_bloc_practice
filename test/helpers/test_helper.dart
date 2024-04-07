import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:sprout_technical_exam/repository/products/product_repository.dart';

@GenerateMocks(
  [ProductRepository],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
