import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = 'product-detail';
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments; // is the id!
    final loadedProduct = Provider.of<Products>(context, listen: false).findById(productId.toString());
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover,),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('\$${loadedProduct.price}', style: const TextStyle(
              color: Colors.grey,
              fontSize: 20
            ),),
            const SizedBox(
              height: 10,
            ),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10), width: double.infinity, child: Text(loadedProduct.description, textAlign: TextAlign.center, softWrap: true,)),

          ],
        ),
      ),
    );
  }
}
