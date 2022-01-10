import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/src/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartStartedEvent) {
      yield* _mapCartStartedEventToState();
    } else if (event is ProductAddedToCartEvent) {
      yield* _mapProductAddedToCartEventToState(event, state);
    } else if (event is ProductRemoveFromCartEvent) {
      yield* _mapProductRemoveFromCartEventToState(event, state);
    }
  }

  Stream<CartState> _mapCartStartedEventToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const CartLoaded();
    } catch (_) {}
  }

  Stream<CartState> _mapProductAddedToCartEventToState(
      ProductAddedToCartEvent event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..add(event.product),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<CartState> _mapProductRemoveFromCartEventToState(
      ProductRemoveFromCartEvent event, CartState state) async* {
        if (state is CartLoaded) {
      try {
        yield CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..remove(event.product),
          ),
        );
      } catch (_) {}
    }
      }
}
