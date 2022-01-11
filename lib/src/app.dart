import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/src/blocs/cart/cart_bloc.dart';
import 'package:shopping_cart/src/blocs/wishlist/wishlist_bloc.dart';
import './configs/config.dart';
import './views/views.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()
            ..add(
              StartWishlist(),
            ),
        ),
        BlocProvider(
          create: (_) => CartBloc()
            ..add(
              CartStartedEvent(),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppClassConfiguration.title_name,
        theme: theme(),
        // home: HomeScreen(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,//HomeScreen.routeName,
      ),
    );
  }
}
