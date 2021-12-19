import 'package:flutter/material.dart';
import './configs/config.dart';
import './views/home/home_screen.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppClassConfiguration.title_name,
      theme: theme(),
      // home: HomeScreen(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
  
}
