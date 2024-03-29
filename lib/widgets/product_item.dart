import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

import '../providers/cart.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: GridTile(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: Consumer<Product>(
                  builder: (ctx, product, _) => IconButton(
                    icon: product.isFavorite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_outline),
                    onPressed: () {
                      product.toggleFavoriteStatus();
                    },
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    cart.addItem(
                        product.id.toString(), product.title, product.price);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Added item to cart!'),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            cart.removeSingleItem(product.id.toString());
                          }),
                    ));
                  },
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ))),
    );
  }
}
