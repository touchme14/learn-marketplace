import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class AddProductScreen extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final ProductService productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _idController, decoration: InputDecoration(labelText: 'Id Produk')),
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Nama Produk')),
            TextField(controller: _descriptionController, decoration: InputDecoration(labelText: 'Deskripsi Produk')),
            TextField(controller: _priceController, decoration: InputDecoration(labelText: 'Harga Produk')),
            TextField(controller: _categoryController, decoration: InputDecoration(labelText: 'Kategori Produk')),
            ElevatedButton(
              onPressed: () {
                final product = Product(
                  id: _idController.text,
                  name: _nameController.text,
                  description: _descriptionController.text,
                  price: int.parse(_priceController.text),
                  category: _categoryController.text,
                );
                productService.addProduct(product);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
