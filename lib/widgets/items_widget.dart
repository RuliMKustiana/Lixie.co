import 'package:flutter/material.dart';
import 'package:shopping/models/product.dart';
import 'package:shopping/service/api_service.dart';

class ItemsWidget extends StatelessWidget {
  final ApiService apiService = ApiService();

  ItemsWidget(List<Map<String, String>> list);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: apiService.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No products available'));
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.68,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return ProductCard(product: product);
            },
          );
        }
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product}); // menggunakan 'required' keyword

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.red.shade900, // Merah gelap
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "-50%",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.red, // Merah
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "itemPage", arguments: product);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.network(
                product.imageUrl,
                height: 120,
                width: 120,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              product.title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black, // Hitam
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              product.description,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey, // Grey
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rp. ${product.price}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Hitam
                  ),
                ),
                Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.grey, // Grey
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}