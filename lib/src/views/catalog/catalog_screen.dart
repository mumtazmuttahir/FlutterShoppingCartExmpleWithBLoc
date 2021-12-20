import 'package:flutter/material.dart';
import 'package:shopping_cart/src/models/models.dart';
import 'package:shopping_cart/src/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  final Category category;

  const CatalogScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Product> categoryProducts = Product.products.where((product) => product.category == category.name).toList();

    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const CustomerNavigationBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.15,
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) {
          return ProdcutCard(
            product: categoryProducts[index],
            widthFctor: 2.3,
          );
        },
      ),
    );
  }
}
