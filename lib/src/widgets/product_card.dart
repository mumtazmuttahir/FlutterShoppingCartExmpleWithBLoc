import 'package:flutter/material.dart';
import 'package:shopping_cart/src/models/models.dart';

class ProdcutCard extends StatelessWidget {

  final Product product;
  final double widthFctor;

  const ProdcutCard({
    Key? key,
    required this.product,
    this.widthFctor = 2.5
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / widthFctor,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFctor - 10,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 5,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFctor - 10,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                color: Colors.white,
                              ),
                        ),
                        Text(
                          '€${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
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