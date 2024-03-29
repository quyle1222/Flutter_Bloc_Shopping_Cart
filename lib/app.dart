import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/auth/bloc/auth_bloc.dart';
import 'package:flutter_shopping_cart/auth/view/auth_page.dart';
import 'package:flutter_shopping_cart/cart/cart.dart';
import 'package:flutter_shopping_cart/catalog/catalog.dart';
import 'package:flutter_shopping_cart/shopping_repository.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.shoppingRepository}) : super(key: key);
  final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatalogBloc(
            shoppingRepository: shoppingRepository,
          )..add(CatalogStarted()),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        ),
        BlocProvider(
          create: (_) => AuthBloc()..add(AuthStarted()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc',
        initialRoute: '/',
        routes: {
          '/': (_) => AuthPage(),
          '/cart': (_) => CartPage(),
          '/catalog': (_) => CatalogPage()
        },
      ),
    );
  }
}
