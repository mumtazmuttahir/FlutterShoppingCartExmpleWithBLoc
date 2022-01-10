part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  //constant constructor
  const CartState();

  //geting a list '[]'
  //saving into the variable 'props' of type List<Object>
  //Where each element in the list is of type Object
  @override
  List<Object> get props => [];

}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final Cart cart;

  const CartLoaded({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];

}

class CartError extends CartState {

  @override
  List<Object> get props => [];
}