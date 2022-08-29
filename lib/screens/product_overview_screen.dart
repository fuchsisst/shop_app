import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FiltersOptions { Favorites, All }

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (FiltersOptions selectedValue) {
                if(selectedValue == FiltersOptions.Favorites) {
                  // ...
                } else {
                  // ...
                }
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
                  ])
        ],
      ),
      body: const ProductsGrid(),
    );
  }
}
