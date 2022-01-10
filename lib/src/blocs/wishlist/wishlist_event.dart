part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {

  const WishlistEvent();

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get preps => [];
  
}

class StartWishlist extends WishlistEvent {
  @override
  List<Object?> get props => [];

}

class AddWishlistProduct extends WishlistEvent {

  final Product product;

  const AddWishlistProduct (this.product);

  @override
  List<Object?> get props => [product];
  
}

class RemoveWishlistProduct extends WishlistEvent {

  final Product product;

  const RemoveWishlistProduct (this.product);

  @override
  List<Object?> get props => [product];
  
}

