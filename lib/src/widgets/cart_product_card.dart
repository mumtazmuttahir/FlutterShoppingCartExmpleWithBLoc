import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/src/models/models.dart';
import 'package:shopping_cart/src/blocs/blocs.dart';

class CartProductCard extends StatelessWidget {
  final Product product;

  const CartProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            //So that the image will fill the box
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          //Name and Price of the product
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                '\$ ${product.price}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    context.read<CartBloc>().add(
                          ProductRemoveFromCartEvent(product),
                        );
                  },
                ),
                Text(
                  '1',
                  style: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: () {
                    context.read<CartBloc>().add(
                          ProductAddedToCartEvent(product),
                        );
                  },
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
