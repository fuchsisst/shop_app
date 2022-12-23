import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import './providers/products.dart';
import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';
import 'providers/cart.dart';
import 'providers/orders.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Lato',
        secondaryHeaderColor: Colors.white70);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (cxt) => Products(),
        ),
        ChangeNotifierProvider(
          create: (cxt) => Cart(),
        ),
        ChangeNotifierProvider(create: (ctx) => Orders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(secondary: Colors.deepOrangeAccent),
        ),
        home: const ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
        },
      ),
    );
  }
}
