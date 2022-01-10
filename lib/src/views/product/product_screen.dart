import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/src/blocs/cart/cart_bloc.dart';
import 'package:shopping_cart/src/blocs/wishlist/wishlist_bloc.dart';
import 'package:shopping_cart/src/models/models.dart';
import 'package:shopping_cart/src/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product),
    );
  }

  final Product product;

  // ignore: use_key_in_widget_constructors
  const ProductScreen(
    this.product,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: product.name),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        context.read<WishlistBloc>().add(AddWishlistProduct(product));
                        const snackBar = SnackBar(content: Text('Added to your wishlist'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(ProductAddedToCartEvent(product),);
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      child: Text(
                        'ADD TO CART',
                        style: Theme.of(context).textTheme.headline3!,
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
        body: ProductCarousel(product: product));
  }
}

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 2,
            autoPlay: true,
          ),
          items: [
            //----<Image Seciton Start>----//
            HeroCarouselCard(
              product: product,
            ),
            //----<Image Seciton End>----//
          ],
        ),
        //----<Name and Price Seciton Start>----//
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Colors.black.withAlpha(50),
                alignment: Alignment.bottomCenter,
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '${product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //----<Name and Price Seciton End>----//
        //----<Product Information Seciton Start>----//
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              'Product Information',
              style: Theme.of(context).textTheme.headline3,
            ),
            children: [
              ListTile(
                title: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipisici elit, … ist ein Blindtext, der nichts bedeuten soll, sondern als Platzhalter im Layout verwendet wird, um einen Eindruck vom fertigen Dokument zu erhalten',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
        //----<Product Information Seciton Start>----//
        //----<Delivery Information Seciton Start>----//
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ExpansionTile(
            initiallyExpanded: false,
            title: Text(
              'Product Information',
              style: Theme.of(context).textTheme.headline3,
            ),
            children: [
              ListTile(
                title: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipisici elit, … ist ein Blindtext, der nichts bedeuten soll, sondern als Platzhalter im Layout verwendet wird, um einen Eindruck vom fertigen Dokument zu erhalten',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
        //----<Delivery Information Seciton Start>----//
      ],
    );
  }
}
