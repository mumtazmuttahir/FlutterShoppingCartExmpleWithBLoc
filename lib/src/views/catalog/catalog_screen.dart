import 'package:flutter/material.dart';
// import '../../widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class CatalogScreen extends StatelessWidget {

  static const String routeName = '/catalog';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(),);
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