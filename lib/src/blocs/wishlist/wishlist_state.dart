part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {

  const WishlistState();

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get preps => [];
  
}

class WishlistLoading extends WishlistState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WishlistLoaded extends WishlistState {
  final Wishlist wishlist;

  const WishlistLoaded ({this.wishlist = const Wishlist()});

  @override
  List<Object?> get props => [wishlist];
}

class WishlistError extends WishlistState {
  @override
  List<Object?> get props => throw UnimplementedError();
}