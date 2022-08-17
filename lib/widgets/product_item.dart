import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  const ProductItem({required this.id, required this.title, required this.imageUrl, Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(imageUrl, fit: BoxFit.cover,),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: const IconButton(icon: Icon(Icons.favorite), onPressed: null,),
        title: Text(title, textAlign: TextAlign.center,),
        trailing: const IconButton(icon: Icon(Icons.shopping_cart), onPressed: null,),
      )
    );
  }
}
