import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =
        ThemeData(primarySwatch: Colors.purple, fontFamily: 'Lato');
    return ChangeNotifierProvider(
      create: (cxt) => Products(),
      child: MaterialApp(
        title: 'MyShop',
        theme: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(secondary: Colors.deepOrangeAccent),
        ),
        home: const ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        },
      ),
    );
  }
}
