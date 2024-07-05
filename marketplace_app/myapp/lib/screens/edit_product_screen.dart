import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class EditProductScreen extends StatelessWidget {
  final Product product;
  final TextEditingController _nameController;
  final TextEditingController _descriptionController;
  final TextEditingController _priceController;
  final TextEditingController _categoryController;
  final ProductService productService = ProductService();

  EditProductScreen({required this.product})
      : _nameController = TextEditingController(text: product.name),
        _descriptionController = TextEditingController(text: product.description),
        _priceController = TextEditingController(text: product.price.toString()),
        _categoryController = TextEditingController(text: product.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Nama Produk')),
            TextField(controller: _descriptionController, decoration: InputDecoration(labelText: 'Deskripsi Produk')),
            TextField(controller: _priceController, decoration: InputDecoration(labelText: 'Harga Produk')),
            TextField(controller: _categoryController, decoration: InputDecoration(labelText: 'Kategori Produk')),
            ElevatedButton(
              onPressed: () {
                final updatedProduct = Product(
                  id: product.id,
                  name: _nameController.text,
                  description: _descriptionController.text,
                  price: int.parse(_priceController.text),
                  category: _categoryController.text,
                );
                productService.updateProduct(updatedProduct);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
