import 'package:shopping_cart/src/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}