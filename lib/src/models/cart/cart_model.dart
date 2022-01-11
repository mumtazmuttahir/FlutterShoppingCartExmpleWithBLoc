import 'package:equatable/equatable.dart';

import '../models.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);
  String get subTotalString => subTotal.toStringAsFixed(2);

  double deliveryFee(subTotal) {
    if (subTotal >= 30.0) {
      return 0.0;
    }
    return 10.0;
  }

  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);

  String freeDelivery(subTotal) {
    if (subTotal >= 30.0) {
      return 'You have a free Delivery';
    }
    double missing = 30.0 - subTotal;
    return 'Add \$ ${missing.toStringAsFixed(2)} for FREE Delivery';
  }

  String get freeDeliveryString => freeDelivery(subTotal);

  double total(subTotal, deliveryFee) {
    return subTotal + deliveryFee(subTotal);
  }

  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);

  Map productQuantity(products) {
    var quantity = {};

    products.forEach(
      (product) {
        if (!quantity.containsKey(product)) {
          quantity[product] = 1;
        } else {
          quantity[product] += 1;
        }
      },
    );

    return quantity;
  }

  // static List<Product> products = [
  //   const Product(
  //     name: 'Soft Drink #1',
  //     category: "Soft Drink",
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: true,
  //   ),
  //   const Product(
  //     name: 'Soft Drink #1',
  //     category: "Soft Drink",
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: true,
  //   ),
  //   const Product(
  //     name: 'Soft Drink #1',
  //     category: "Soft Drink",
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: true,
  //   ),
  //   const Product(
  //     name: 'Smoothies #1',
  //     category: "Smoothies",
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: true,
  //   ),
  //   const Product(
  //     name: 'Smoothies #2',
  //     category: "Smoothies",
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  //     price: 2.99,
  //     isRecommended: false,
  //     isPopular: true,
  //   ),
  // ];

  @override
  List<Object?> get props => [products];
}
