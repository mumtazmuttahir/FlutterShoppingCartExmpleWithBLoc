import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:shopping_cart/src/models/models.dart';

import '../../widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Zara to Shop'),
      bottomNavigationBar: const CustomerNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //----<Carousel Section Start>----//
            const SectionCaroursel(),
            //----<Carousel Section End>----//
            //----<Recommended Text Section Start>----//
            const SectionTitle(
              title: 'RECOMMENDTED',
            ),
            //----<Recommended Text Section End>----//
            //----<Products Section Start>----//
            ProductCarousel(
              products: Product.products.where((product) => product.isRecommended).toList(),
            ),
            //----<Products Section End>----//
            //----<Popular Text Section Start>----//
            const SectionTitle(
              title: 'POPULAR',
            ),
            //----<Popular Text Section End>----//
            //----<Products Section Start>----//
            ProductCarousel(
              products: Product.products.where((product) => product.isPopular).toList(),
            ),
            //----<Products Section End>----//
          ],
        ),
      ),
    );
  }
}



class SectionCaroursel extends StatelessWidget {
  const SectionCaroursel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 1.5,
        viewportFraction: 0.9,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 2,
        autoPlay: true,
      ),
      items: Category.categories
          .map((category) => HeroCarouselCard(category: category))
          .toList(),
    );
  }
}
