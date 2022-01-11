import 'dart:async';

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  // const SplashScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                width: 125.0,
                height: 125.0,
              ),
            ),
            Text(
              'Shopping Cart Demo',
            ),
          ],
        ),
      ),
    );
  }
}
