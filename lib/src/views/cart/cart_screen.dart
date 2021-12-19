import 'package:flutter/material.dart';
// import '../../widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class CartScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CartScreen(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: 'Zara to Shop'),
      // bottomNavigationBar: const CustomerNavigationBar(),
      body: Container(),
    );
  }
}