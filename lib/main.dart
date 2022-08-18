import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =
        ThemeData(primarySwatch: Colors.purple, fontFamily: 'Lato');
    return MaterialApp(
      title: 'MyShop',
      theme: theme.copyWith(
        colorScheme:
            theme.colorScheme.copyWith(secondary: Colors.deepOrangeAccent),
      ),
      home: ProductOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
      },
    );
  }
}
