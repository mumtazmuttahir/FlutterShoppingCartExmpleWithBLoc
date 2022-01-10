part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  //Constant constructor
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStartedEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class ProductAddedToCartEvent extends CartEvent {
  final Product product;

  const ProductAddedToCartEvent(this.product);
  @override
  List<Object> get props => [];
}

class ProductRemoveFromCartEvent extends CartEvent {
  final Product product;

  const ProductRemoveFromCartEvent(this.product);
  @override
  List<Object> get props => [];
}