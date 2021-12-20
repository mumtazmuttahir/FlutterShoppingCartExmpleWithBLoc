import 'package:flutter/material.dart';
import 'package:shopping_cart/src/models/models.dart';
import 'package:shopping_cart/src/views/cart/cart_screen.dart';
import 'package:shopping_cart/src/views/home/home_screen.dart';
import 'package:shopping_cart/src/views/product/product_screen.dart';
import 'package:shopping_cart/src/views/wishlist/wishlist_screen.dart';
import 'package:shopping_cart/src/views/catalog/catalog_screen.dart';

class AppRouter {
  static Route onGenerateRoute (RouteSettings settings) {
    // ignore: avoid_print
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      // ignore: no_duplicate_case_values
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute () {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
      ));
  }
}