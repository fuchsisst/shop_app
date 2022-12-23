import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_draw.dart';

import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';

enum FiltersOptions { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (FiltersOptions selectedValue) {
                setState(() {
                  if (selectedValue == FiltersOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              itemBuilder: (_) => const [
                    PopupMenuItem(
                      child: Text("Only Favorites"),
                      value: FiltersOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text("Show All"),
                      value: FiltersOptions.All,
                    ),
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                ),
                value: cart.itemCount.toString()),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(showFavs: _showOnlyFavorites),
    );
  }
}
