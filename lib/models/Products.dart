import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  final int id;
  final String image;
  final String title;
  final String description;
  final num price;
  final Color color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.color,
  });


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['thumbnail'],
      color: Color(0xFFAEAEAE),
    );
  }
}


Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse("https://dummyjson.com/products?limit=10"));
  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
    final data = jsonDecode(response.body);
    List<Product> productList = (data['products'] as List)
        .map((productData) => Product.fromJson(productData))
        .toList();
    return productList;
  } else {
    throw Exception('Failed to load products');
  }
}


class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No products found.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      product.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    onTap: () {

                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}






// import 'package:flutter/material.dart';
//
// class Product {
//   final String image, title, description;
//   final int price, id;
//   final Color color;
//
//   Product(
//       {required this.image,
//         required this.title,
//         required this.description,
//         required this.price,
//
//         required this.id,
//         required this.color});
// }
//
// List<Product> products = [
//   Product(
//       id: 1,
//       title: "Manish Malhotra",
//       price: 200,
//
//       description: dummyText,
//       image: "assets/images/lipstick1.jpeg",
//       color: Color(0xFF3D82AE)),
//   Product(
//       id: 2,
//       title: "MAC Matte",
//       price: 230,
//
//       description: dummyText,
//       image: "assets/images/lipstick2.jpeg",
//       color: Color(0xFFD3A984)),
//   Product(
//       id: 3,
//       title: "RENEE",
//       price: 134,
//       description: dummyText,
//       image: "assets/images/lipstick3.jpeg",
//       color: Color(0xFF989493)),
//   Product(
//       id: 4,
//       title: "Maybelline",
//       price: 245,
//
//       description: dummyText,
//       image: "assets/images/lipstick4.jpeg",
//       color: Color(0xFFE6B398)),
//   Product(
//       id: 5,
//       title: "Creamy Mattes",
//       price: 189,
//       description: dummyText,
//       image: "assets/images/lipstick5.jpeg",
//       color: Color(0xFFFB7883)),
//   Product(
//     id: 6,
//     title: "Lakme 9t05",
//     price: 164,
//     description: dummyText,
//     image: "assets/images/lipstick7.jpeg",
//     color: Color(0xFFAEAEAE),
//   ),
//   Product(
//     id: 7,
//     title: "Lakme",
//     price: 163,
//     description: dummyText,
//     image: "assets/images/lipsticks.jpeg",
//     color: Color(0xFF3D82AE),
//   ),
//   Product(
//     id: 8,
//     title: "RENEE liquid",
//     price: 229,
//     description: dummyText,
//     image: "assets/images/lipstick3.jpeg",
//     color: Color(0xFFE6B398),
//   ),
// ];
//
// String dummyText =
//     "Enhance your beauty with lipsticks. Our smooth, long-lasting formula offers vibrant colors that suit every occasion. Whether you prefer a natural look or a bold statement, we’ve got the perfect shade for you.";
