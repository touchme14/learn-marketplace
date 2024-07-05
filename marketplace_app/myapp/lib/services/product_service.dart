import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(Product product) async {
    await productCollection.doc(product.id).set(product.toMap());
  }

  Future<void> updateProduct(Product product) async {
    await productCollection.doc(product.id).update(product.toMap());
  }

  Future<void> deleteProduct(String id) async {
    await productCollection.doc(id).delete();
  }

  Stream<List<Product>> getProducts() {
    return productCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
