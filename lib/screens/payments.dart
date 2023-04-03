// import 'package:flutter/material.dart';

// class PaymentScreen extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Select Payment Method:'),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // TODO: Implement mobile money payment
//                 },
//                 child: const Text('Mobile Money'),
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // TODO: Implement bank payment
//                 },
//                 child: Text('Bank Payment'),
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 // ignore: prefer_const_constructors
//                 decoration: InputDecoration(
//                   labelText: 'Phone Number',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your phone number';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 // ignore: prefer_const_constructors
//                 decoration: InputDecoration(
//                   labelText: 'Account Number',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your account number';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Purchase Successful')),
//                     );
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: const Text('Confirm Purchase'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProductCatalog extends StatelessWidget {
//   const ProductCatalog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Catalog'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Product Catalog'),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PaymentScreen()),
//                 );
//               },
//               child: const Text('Purchase Product'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

// import 'package:product_catologue/product_catalog.dart';
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

class ProductCatalog extends StatelessWidget {
  final List<Product> products = [
    // 'Product 1',
    // 'Product 2',
    // 'Product 3',
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

  ProductCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index] as String),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Options'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Text('Mobile Money'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: const Text('Bank Payment'),
            ),
            const SizedBox(height: 16.0),
            if (_selectedIndex >= 0)
              Text(
                'Selected Payment Method: ${_selectedIndex == 0 ? 'Mobile Money' : 'Bank Payment'}',
                style: const TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductCatalog()),
                );
              },
              child: const Text('Back to Catalog'),
            ),
          ],
        ),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the App',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductCatalog(),
                  ),
                );
              },
              child: const Text('Go to Catalog'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: LandingPage(),
  ));
}
