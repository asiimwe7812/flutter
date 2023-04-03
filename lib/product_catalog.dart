import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

final List<Product> products = [
  const Product(
    name: 'Product 1',
    description: 'Description of product 1',
    price: 10.0,
    imageUrl:
        'https://media.gq-magazine.co.uk/photos/62e1018f462bbdd05e0f7e2c/master/pass/AmazonS_HP.jpg',
  ),
  const Product(
    name: 'Product 2',
    description: 'Description of product 2',
    price: 20.0,
    imageUrl:
        'https://down-ph.img.susercontent.com/file/5596e9c43528a2fb87f3b1c45c2effb3',
  ),
  const Product(
    name: 'Product 3',
    description: 'Description of product 3',
    price: 30.0,
    imageUrl:
        'https://images.meesho.com/images/products/104557073/6alv5_512.jpg',
  ),
  const Product(
    name: 'Product 3',
    description: 'Description of product 3',
    price: 30.0,
    imageUrl:
        'https://images.meesho.com/images/products/104557073/6alv5_512.jpg',
  ),
  const Product(
    name: 'Product 3',
    description: 'Description of product 3',
    price: 30.0,
    imageUrl:
        'https://images.meesho.com/images/products/104557073/6alv5_512.jpg',
  ),
];

class ProductCatalog extends StatelessWidget {
  const ProductCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Product Catalog',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
              title: Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(product.description),
              trailing: Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.blue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

