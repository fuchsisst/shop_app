import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primaryColor: Colors.purple,
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.deepOrangeAccent),
        fontFamily: 'Lato'
      ),
      home: ProductOverviewScreen(),
    );
  }
}

