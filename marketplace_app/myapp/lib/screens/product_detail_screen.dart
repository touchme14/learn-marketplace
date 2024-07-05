import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';
import 'edit_product_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Detail')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Name: ${product.name}'),
            Text('Description: ${product.description}'),
            Text('Price: ${product.price}'),
            Text('Category: ${product.category}'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProductScreen(product: product)),
                );
              },
              child: Text('Edit'),
            ),
            ElevatedButton(
              onPressed: () {
                ProductService().deleteProduct(product.id);
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
