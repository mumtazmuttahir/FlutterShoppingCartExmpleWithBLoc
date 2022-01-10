import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/src/blocs/blocs.dart';
import 'package:shopping_cart/src/blocs/wishlist/wishlist_bloc.dart';
import 'package:shopping_cart/src/models/models.dart';

class ProdcutCard extends StatelessWidget {
  final Product product;
  final double widthFctor;
  final double leftPosition;
  final bool isWishlist;

  const ProdcutCard(
      {Key? key,
      required this.product,
      this.widthFctor = 2.5,
      this.leftPosition = 5,
      this.isWishlist = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFctor;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          SizedBox(
            width: widthValue,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            right: leftPosition <= 6 ? 10 : 10,
            child: Container(
              width: widthValue - 5 - leftPosition,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            right: leftPosition <= 6 ? 10 : 10,
            child: Container(
              width: widthValue - 10 - leftPosition,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          Text(
                            '€${product.price}',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                      if (state is CartLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CartLoaded) {
                        return Expanded(
                          flex: isWishlist ? 3 : 4,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                context.read<CartBloc>().add(ProductAddedToCartEvent(product));
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Text('Something is wrong');
                      }
                    }),
                    isWishlist
                        ? Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: BlocBuilder<WishlistBloc, WishlistState>(
                                builder: (context, state) {
                                  return IconButton(
                                    onPressed: () {
                                      context
                                          .read<WishlistBloc>()
                                          .add(RemoveWishlistProduct(product));

                                      const snackBar = SnackBar(
                                          content: Text(
                                              'Removed from your wishlist'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  );
                                },
                              ),

                              // IconButton(
                              //   onPressed: () {},
                              //   icon: const Icon(
                              //     Icons.delete,
                              //     color: Colors.white,
                              //   ),
                              // ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
